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
-- Submodules: 124
entity add2_0CLK_b14a5a36 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_b14a5a36;
architecture arch of add2_0CLK_b14a5a36 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l647_c6_d01f]
signal BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l647_c1_680d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l647_c2_0997]
signal n16_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l647_c2_0997]
signal tmp16_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l647_c2_0997]
signal t16_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l647_c2_0997]
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l647_c2_0997]
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l647_c2_0997]
signal result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l647_c2_0997]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l647_c2_0997]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l647_c2_0997]
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l647_c2_0997]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l647_c2_0997]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l648_c3_0df2[uxn_opcodes_h_l648_c3_0df2]
signal printf_uxn_opcodes_h_l648_c3_0df2_uxn_opcodes_h_l648_c3_0df2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l655_c11_71b6]
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l655_c7_9d3a]
signal n16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l655_c7_9d3a]
signal tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l655_c7_9d3a]
signal t16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l655_c7_9d3a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l655_c7_9d3a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l655_c7_9d3a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l655_c7_9d3a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l655_c7_9d3a]
signal result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l655_c7_9d3a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l655_c7_9d3a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l659_c11_a715]
signal BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l659_c7_b36b]
signal n16_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l659_c7_b36b]
signal tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l659_c7_b36b]
signal t16_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l659_c7_b36b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l659_c7_b36b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l659_c7_b36b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l659_c7_b36b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l659_c7_b36b]
signal result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l659_c7_b36b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l659_c7_b36b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l665_c11_7acf]
signal BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l665_c7_7f88]
signal n16_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l665_c7_7f88]
signal tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l665_c7_7f88]
signal t16_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l665_c7_7f88]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l665_c7_7f88]
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l665_c7_7f88]
signal result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l665_c7_7f88]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l665_c7_7f88]
signal result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l665_c7_7f88]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l665_c7_7f88]
signal result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l669_c11_5d09]
signal BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l669_c7_7849]
signal n16_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l669_c7_7849]
signal tmp16_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l669_c7_7849]
signal t16_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l669_c7_7849]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l669_c7_7849]
signal result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l669_c7_7849]
signal result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l669_c7_7849]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l669_c7_7849]
signal result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l669_c7_7849]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l669_c7_7849]
signal result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l670_c3_22ad]
signal BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l674_c11_1ea1]
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l674_c7_20b0]
signal n16_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l674_c7_20b0]
signal tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l674_c7_20b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l674_c7_20b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l674_c7_20b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l674_c7_20b0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l674_c7_20b0]
signal result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c7_20b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l674_c7_20b0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l678_c11_ba02]
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l678_c7_f105]
signal n16_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l678_c7_f105_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l678_c7_f105]
signal tmp16_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l678_c7_f105_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l678_c7_f105]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l678_c7_f105]
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l678_c7_f105]
signal result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l678_c7_f105]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l678_c7_f105]
signal result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l678_c7_f105]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l678_c7_f105]
signal result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l684_c11_b51f]
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l684_c7_82ba]
signal n16_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l684_c7_82ba]
signal tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l684_c7_82ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l684_c7_82ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l684_c7_82ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l684_c7_82ba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l684_c7_82ba]
signal result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l684_c7_82ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l684_c7_82ba]
signal result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l688_c11_9837]
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l688_c7_25f4]
signal n16_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l688_c7_25f4]
signal tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c7_25f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l688_c7_25f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l688_c7_25f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l688_c7_25f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l688_c7_25f4]
signal result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c7_25f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l688_c7_25f4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l689_c3_4859]
signal BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l690_c11_ab65]
signal BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l693_c32_97c4]
signal BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l693_c32_0164]
signal BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l693_c32_46d6]
signal MUX_uxn_opcodes_h_l693_c32_46d6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l693_c32_46d6_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l693_c32_46d6_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l693_c32_46d6_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l695_c11_0555]
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l695_c7_f003]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l695_c7_f003]
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l695_c7_f003]
signal result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l695_c7_f003]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l695_c7_f003]
signal result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l701_c11_2a9c]
signal BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l701_c7_d0d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l701_c7_d0d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l701_c7_d0d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l701_c7_d0d9]
signal result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l704_c34_e67b]
signal CONST_SR_8_uxn_opcodes_h_l704_c34_e67b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l704_c34_e67b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l706_c11_4c53]
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l706_c7_6420]
signal result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_6420]
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_49dd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_read := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_sp_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f
BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_left,
BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_right,
BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_return_output);

-- n16_MUX_uxn_opcodes_h_l647_c2_0997
n16_MUX_uxn_opcodes_h_l647_c2_0997 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l647_c2_0997_cond,
n16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue,
n16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse,
n16_MUX_uxn_opcodes_h_l647_c2_0997_return_output);

-- tmp16_MUX_uxn_opcodes_h_l647_c2_0997
tmp16_MUX_uxn_opcodes_h_l647_c2_0997 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l647_c2_0997_cond,
tmp16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue,
tmp16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse,
tmp16_MUX_uxn_opcodes_h_l647_c2_0997_return_output);

-- t16_MUX_uxn_opcodes_h_l647_c2_0997
t16_MUX_uxn_opcodes_h_l647_c2_0997 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l647_c2_0997_cond,
t16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue,
t16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse,
t16_MUX_uxn_opcodes_h_l647_c2_0997_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997
result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997
result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997
result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_cond,
result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997
result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_return_output);

-- printf_uxn_opcodes_h_l648_c3_0df2_uxn_opcodes_h_l648_c3_0df2
printf_uxn_opcodes_h_l648_c3_0df2_uxn_opcodes_h_l648_c3_0df2 : entity work.printf_uxn_opcodes_h_l648_c3_0df2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l648_c3_0df2_uxn_opcodes_h_l648_c3_0df2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6
BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_left,
BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_right,
BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_return_output);

-- n16_MUX_uxn_opcodes_h_l655_c7_9d3a
n16_MUX_uxn_opcodes_h_l655_c7_9d3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond,
n16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue,
n16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse,
n16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a
tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond,
tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue,
tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse,
tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output);

-- t16_MUX_uxn_opcodes_h_l655_c7_9d3a
t16_MUX_uxn_opcodes_h_l655_c7_9d3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond,
t16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue,
t16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse,
t16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a
result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a
result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_cond,
result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715
BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_left,
BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_right,
BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_return_output);

-- n16_MUX_uxn_opcodes_h_l659_c7_b36b
n16_MUX_uxn_opcodes_h_l659_c7_b36b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l659_c7_b36b_cond,
n16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue,
n16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse,
n16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l659_c7_b36b
tmp16_MUX_uxn_opcodes_h_l659_c7_b36b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_cond,
tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue,
tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse,
tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output);

-- t16_MUX_uxn_opcodes_h_l659_c7_b36b
t16_MUX_uxn_opcodes_h_l659_c7_b36b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l659_c7_b36b_cond,
t16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue,
t16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse,
t16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b
result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b
result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b
result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b
result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_cond,
result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b
result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf
BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_left,
BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_right,
BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_return_output);

-- n16_MUX_uxn_opcodes_h_l665_c7_7f88
n16_MUX_uxn_opcodes_h_l665_c7_7f88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l665_c7_7f88_cond,
n16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue,
n16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse,
n16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output);

-- tmp16_MUX_uxn_opcodes_h_l665_c7_7f88
tmp16_MUX_uxn_opcodes_h_l665_c7_7f88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_cond,
tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue,
tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse,
tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output);

-- t16_MUX_uxn_opcodes_h_l665_c7_7f88
t16_MUX_uxn_opcodes_h_l665_c7_7f88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l665_c7_7f88_cond,
t16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue,
t16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse,
t16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88
result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88
result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_cond,
result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09
BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_left,
BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_right,
BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_return_output);

-- n16_MUX_uxn_opcodes_h_l669_c7_7849
n16_MUX_uxn_opcodes_h_l669_c7_7849 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l669_c7_7849_cond,
n16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue,
n16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse,
n16_MUX_uxn_opcodes_h_l669_c7_7849_return_output);

-- tmp16_MUX_uxn_opcodes_h_l669_c7_7849
tmp16_MUX_uxn_opcodes_h_l669_c7_7849 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l669_c7_7849_cond,
tmp16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue,
tmp16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse,
tmp16_MUX_uxn_opcodes_h_l669_c7_7849_return_output);

-- t16_MUX_uxn_opcodes_h_l669_c7_7849
t16_MUX_uxn_opcodes_h_l669_c7_7849 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l669_c7_7849_cond,
t16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue,
t16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse,
t16_MUX_uxn_opcodes_h_l669_c7_7849_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849
result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849
result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849
result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_cond,
result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849
result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849
result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad
BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_left,
BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_right,
BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1
BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_left,
BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_right,
BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_return_output);

-- n16_MUX_uxn_opcodes_h_l674_c7_20b0
n16_MUX_uxn_opcodes_h_l674_c7_20b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l674_c7_20b0_cond,
n16_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue,
n16_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse,
n16_MUX_uxn_opcodes_h_l674_c7_20b0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l674_c7_20b0
tmp16_MUX_uxn_opcodes_h_l674_c7_20b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_cond,
tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue,
tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse,
tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0
result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0
result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_cond,
result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0
result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02
BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_left,
BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_right,
BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_return_output);

-- n16_MUX_uxn_opcodes_h_l678_c7_f105
n16_MUX_uxn_opcodes_h_l678_c7_f105 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l678_c7_f105_cond,
n16_MUX_uxn_opcodes_h_l678_c7_f105_iftrue,
n16_MUX_uxn_opcodes_h_l678_c7_f105_iffalse,
n16_MUX_uxn_opcodes_h_l678_c7_f105_return_output);

-- tmp16_MUX_uxn_opcodes_h_l678_c7_f105
tmp16_MUX_uxn_opcodes_h_l678_c7_f105 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l678_c7_f105_cond,
tmp16_MUX_uxn_opcodes_h_l678_c7_f105_iftrue,
tmp16_MUX_uxn_opcodes_h_l678_c7_f105_iffalse,
tmp16_MUX_uxn_opcodes_h_l678_c7_f105_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105
result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105
result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_cond,
result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105
result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f
BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_left,
BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_right,
BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_return_output);

-- n16_MUX_uxn_opcodes_h_l684_c7_82ba
n16_MUX_uxn_opcodes_h_l684_c7_82ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l684_c7_82ba_cond,
n16_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue,
n16_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse,
n16_MUX_uxn_opcodes_h_l684_c7_82ba_return_output);

-- tmp16_MUX_uxn_opcodes_h_l684_c7_82ba
tmp16_MUX_uxn_opcodes_h_l684_c7_82ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_cond,
tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue,
tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse,
tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba
result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba
result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_cond,
result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba
result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837
BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_left,
BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_right,
BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_return_output);

-- n16_MUX_uxn_opcodes_h_l688_c7_25f4
n16_MUX_uxn_opcodes_h_l688_c7_25f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l688_c7_25f4_cond,
n16_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue,
n16_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse,
n16_MUX_uxn_opcodes_h_l688_c7_25f4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l688_c7_25f4
tmp16_MUX_uxn_opcodes_h_l688_c7_25f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_cond,
tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue,
tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse,
tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4
result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4
result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_cond,
result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l689_c3_4859
BIN_OP_OR_uxn_opcodes_h_l689_c3_4859 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_left,
BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_right,
BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65
BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_left,
BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_right,
BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4
BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_left,
BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_right,
BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l693_c32_0164
BIN_OP_GT_uxn_opcodes_h_l693_c32_0164 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_left,
BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_right,
BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_return_output);

-- MUX_uxn_opcodes_h_l693_c32_46d6
MUX_uxn_opcodes_h_l693_c32_46d6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l693_c32_46d6_cond,
MUX_uxn_opcodes_h_l693_c32_46d6_iftrue,
MUX_uxn_opcodes_h_l693_c32_46d6_iffalse,
MUX_uxn_opcodes_h_l693_c32_46d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555
BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_left,
BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_right,
BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003
result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_cond,
result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c
BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_left,
BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_right,
BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9
result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_cond,
result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l704_c34_e67b
CONST_SR_8_uxn_opcodes_h_l704_c34_e67b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l704_c34_e67b_x,
CONST_SR_8_uxn_opcodes_h_l704_c34_e67b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53
BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_left,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_right,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420
result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35
CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_return_output,
 n16_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
 tmp16_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
 t16_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_return_output,
 n16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output,
 tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output,
 t16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_return_output,
 n16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output,
 tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output,
 t16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_return_output,
 n16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output,
 tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output,
 t16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_return_output,
 n16_MUX_uxn_opcodes_h_l669_c7_7849_return_output,
 tmp16_MUX_uxn_opcodes_h_l669_c7_7849_return_output,
 t16_MUX_uxn_opcodes_h_l669_c7_7849_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_return_output,
 BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_return_output,
 n16_MUX_uxn_opcodes_h_l674_c7_20b0_return_output,
 tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_return_output,
 n16_MUX_uxn_opcodes_h_l678_c7_f105_return_output,
 tmp16_MUX_uxn_opcodes_h_l678_c7_f105_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_return_output,
 n16_MUX_uxn_opcodes_h_l684_c7_82ba_return_output,
 tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_return_output,
 n16_MUX_uxn_opcodes_h_l688_c7_25f4_return_output,
 tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_return_output,
 BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_return_output,
 BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_return_output,
 MUX_uxn_opcodes_h_l693_c32_46d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output,
 CONST_SR_8_uxn_opcodes_h_l704_c34_e67b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l651_c3_34c9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l648_c3_0df2_uxn_opcodes_h_l648_c3_0df2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l657_c3_5abb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l663_c3_7416 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l667_c3_82c5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_4144 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l678_c7_f105_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_f105_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l676_c3_6a54 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_c492 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l686_c3_e8f1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l690_c3_5ff7 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l688_c7_25f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l693_c32_46d6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l693_c32_46d6_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l693_c32_46d6_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l693_c32_46d6_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_d4ed : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l699_c24_92ca_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_4bab : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_e67b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_e67b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l704_c24_ba32_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_1890_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_f440_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_90bd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_efa5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_6b33_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l660_l679_l689_l670_DUPLICATE_2913_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l701_l688_DUPLICATE_0d81_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l643_l711_DUPLICATE_855d_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_right := to_unsigned(11, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l657_c3_5abb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l657_c3_5abb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l693_c32_46d6_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l667_c3_82c5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l667_c3_82c5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l676_c3_6a54 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l676_c3_6a54;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_4bab := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_4bab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l686_c3_e8f1 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l686_c3_e8f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_d4ed := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_d4ed;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l651_c3_34c9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l651_c3_34c9;
     VAR_MUX_uxn_opcodes_h_l693_c32_46d6_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_c492 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_c492;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_4144 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_4144;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l663_c3_7416 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l663_c3_7416;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_right := to_unsigned(0, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_e67b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_f105_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l684_c11_b51f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_left;
     BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_return_output := BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l693_c32_97c4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_left;
     BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_return_output := BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l699_c24_92ca] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l699_c24_92ca_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l660_l679_l689_l670_DUPLICATE_2913 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l660_l679_l689_l670_DUPLICATE_2913_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l688_c11_9837] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_left;
     BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_return_output := BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l669_c11_5d09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_left;
     BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_return_output := BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_f440 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_f440_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_1890 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_1890_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l695_c11_0555] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_left;
     BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_return_output := BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_efa5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_efa5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l674_c11_1ea1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_left;
     BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_return_output := BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l701_c11_2a9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_90bd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_90bd_return_output := result.is_sp_shift;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l688_c7_25f4] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l688_c7_25f4_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l665_c11_7acf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_left;
     BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_return_output := BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l678_c11_ba02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_left;
     BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_return_output := BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l701_l688_DUPLICATE_0d81 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l701_l688_DUPLICATE_0d81_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l655_c11_71b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_6b33 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_6b33_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l704_c34_e67b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l704_c34_e67b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_e67b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_e67b_return_output := CONST_SR_8_uxn_opcodes_h_l704_c34_e67b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l659_c11_a715] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_left;
     BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_return_output := BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l647_c6_d01f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_left;
     BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output := BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l647_c2_0997] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_c2_0997_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l706_c11_4c53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_left;
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_return_output := BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_left := VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_97c4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l647_c2_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l647_c2_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_d01f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_71b6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l659_c7_b36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l659_c7_b36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_a715_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l665_c7_7f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l665_c7_7f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7acf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l669_c7_7849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l669_c7_7849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_7849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_5d09_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l674_c7_20b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_1ea1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l678_c7_f105_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_f105_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_ba02_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l684_c7_82ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_b51f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l688_c7_25f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_9837_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_0555_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2a9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_4c53_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l660_l679_l689_l670_DUPLICATE_2913_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l660_l679_l689_l670_DUPLICATE_2913_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l660_l679_l689_l670_DUPLICATE_2913_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l699_c24_92ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_f440_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_f440_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_f440_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_f440_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_f440_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_f440_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_f440_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_f440_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_f440_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_efa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_efa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_efa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_efa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_efa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_efa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_efa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_efa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_efa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_efa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_efa5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_90bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_90bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_90bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_90bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_90bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_90bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_90bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_90bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_90bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_6b33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_6b33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_6b33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_6b33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_6b33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_6b33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_6b33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_6b33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_6b33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l701_l688_DUPLICATE_0d81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l701_l688_DUPLICATE_0d81_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_1890_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_1890_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_1890_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_1890_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_1890_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_1890_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_1890_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_1890_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_1890_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_1890_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_c2_0997_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l688_c7_25f4_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l688_c7_25f4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l647_c2_0997] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l704_c24_ba32] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l704_c24_ba32_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_e67b_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l689_c3_4859] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_left;
     BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_return_output := BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l693_c32_0164] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_left;
     BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_return_output := BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l695_c7_f003] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l670_c3_22ad] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_left;
     BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_return_output := BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_6420] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l706_c7_6420] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l701_c7_d0d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l647_c1_680d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l693_c32_46d6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0164_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_22ad_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_right := VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_4859_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l704_c24_ba32_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l678_c7_f105_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_7d35_return_output;
     VAR_printf_uxn_opcodes_h_l648_c3_0df2_uxn_opcodes_h_l648_c3_0df2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_680d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_6420_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_f003_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_6420_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output;
     -- printf_uxn_opcodes_h_l648_c3_0df2[uxn_opcodes_h_l648_c3_0df2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l648_c3_0df2_uxn_opcodes_h_l648_c3_0df2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l648_c3_0df2_uxn_opcodes_h_l648_c3_0df2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_PLUS[uxn_opcodes_h_l690_c11_ab65] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_left;
     BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_return_output := BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l701_c7_d0d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output;

     -- n16_MUX[uxn_opcodes_h_l688_c7_25f4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l688_c7_25f4_cond <= VAR_n16_MUX_uxn_opcodes_h_l688_c7_25f4_cond;
     n16_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue;
     n16_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l688_c7_25f4_return_output := n16_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l684_c7_82ba] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l701_c7_d0d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output;

     -- t16_MUX[uxn_opcodes_h_l669_c7_7849] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l669_c7_7849_cond <= VAR_t16_MUX_uxn_opcodes_h_l669_c7_7849_cond;
     t16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue;
     t16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l669_c7_7849_return_output := t16_MUX_uxn_opcodes_h_l669_c7_7849_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l701_c7_d0d9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output := result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l695_c7_f003] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l688_c7_25f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;

     -- MUX[uxn_opcodes_h_l693_c32_46d6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l693_c32_46d6_cond <= VAR_MUX_uxn_opcodes_h_l693_c32_46d6_cond;
     MUX_uxn_opcodes_h_l693_c32_46d6_iftrue <= VAR_MUX_uxn_opcodes_h_l693_c32_46d6_iftrue;
     MUX_uxn_opcodes_h_l693_c32_46d6_iffalse <= VAR_MUX_uxn_opcodes_h_l693_c32_46d6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l693_c32_46d6_return_output := MUX_uxn_opcodes_h_l693_c32_46d6_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l690_c3_5ff7 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_ab65_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue := VAR_MUX_uxn_opcodes_h_l693_c32_46d6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse := VAR_n16_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_f003_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_d0d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse := VAR_t16_MUX_uxn_opcodes_h_l669_c7_7849_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue := VAR_tmp16_uxn_opcodes_h_l690_c3_5ff7;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c7_25f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l688_c7_25f4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_cond;
     tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_return_output := tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;

     -- n16_MUX[uxn_opcodes_h_l684_c7_82ba] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l684_c7_82ba_cond <= VAR_n16_MUX_uxn_opcodes_h_l684_c7_82ba_cond;
     n16_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue;
     n16_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l684_c7_82ba_return_output := n16_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;

     -- t16_MUX[uxn_opcodes_h_l665_c7_7f88] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l665_c7_7f88_cond <= VAR_t16_MUX_uxn_opcodes_h_l665_c7_7f88_cond;
     t16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue;
     t16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output := t16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l695_c7_f003] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_cond;
     result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_return_output := result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l695_c7_f003] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c7_25f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l695_c7_f003] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l684_c7_82ba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l678_c7_f105] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l678_c7_f105_iffalse := VAR_n16_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_f003_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_f105_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_f003_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_f003_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l684_c7_82ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l678_c7_f105] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l688_c7_25f4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_return_output := result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l684_c7_82ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l688_c7_25f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l674_c7_20b0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;

     -- n16_MUX[uxn_opcodes_h_l678_c7_f105] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l678_c7_f105_cond <= VAR_n16_MUX_uxn_opcodes_h_l678_c7_f105_cond;
     n16_MUX_uxn_opcodes_h_l678_c7_f105_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l678_c7_f105_iftrue;
     n16_MUX_uxn_opcodes_h_l678_c7_f105_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l678_c7_f105_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l678_c7_f105_return_output := n16_MUX_uxn_opcodes_h_l678_c7_f105_return_output;

     -- t16_MUX[uxn_opcodes_h_l659_c7_b36b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l659_c7_b36b_cond <= VAR_t16_MUX_uxn_opcodes_h_l659_c7_b36b_cond;
     t16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue;
     t16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output := t16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l688_c7_25f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l684_c7_82ba] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_cond;
     tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue;
     tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_return_output := tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l678_c7_f105_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_f105_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_25f4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_f105_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l678_c7_f105] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_return_output;

     -- t16_MUX[uxn_opcodes_h_l655_c7_9d3a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond <= VAR_t16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond;
     t16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue;
     t16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output := t16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;

     -- n16_MUX[uxn_opcodes_h_l674_c7_20b0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l674_c7_20b0_cond <= VAR_n16_MUX_uxn_opcodes_h_l674_c7_20b0_cond;
     n16_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue;
     n16_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l674_c7_20b0_return_output := n16_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l678_c7_f105] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l678_c7_f105] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l678_c7_f105_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_f105_cond;
     tmp16_MUX_uxn_opcodes_h_l678_c7_f105_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_f105_iftrue;
     tmp16_MUX_uxn_opcodes_h_l678_c7_f105_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_f105_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_f105_return_output := tmp16_MUX_uxn_opcodes_h_l678_c7_f105_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l684_c7_82ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l684_c7_82ba] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_cond;
     result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_return_output := result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l674_c7_20b0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l669_c7_7849] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l684_c7_82ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse := VAR_n16_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_7849_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_f105_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_f105_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_82ba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse := VAR_t16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_f105_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l678_c7_f105] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_cond;
     result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_return_output := result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l674_c7_20b0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_cond;
     tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_return_output := tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l674_c7_20b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c7_20b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l669_c7_7849] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l678_c7_f105] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_return_output;

     -- n16_MUX[uxn_opcodes_h_l669_c7_7849] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l669_c7_7849_cond <= VAR_n16_MUX_uxn_opcodes_h_l669_c7_7849_cond;
     n16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue;
     n16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l669_c7_7849_return_output := n16_MUX_uxn_opcodes_h_l669_c7_7849_return_output;

     -- t16_MUX[uxn_opcodes_h_l647_c2_0997] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l647_c2_0997_cond <= VAR_t16_MUX_uxn_opcodes_h_l647_c2_0997_cond;
     t16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue;
     t16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l647_c2_0997_return_output := t16_MUX_uxn_opcodes_h_l647_c2_0997_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l665_c7_7f88] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l678_c7_f105] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse := VAR_n16_MUX_uxn_opcodes_h_l669_c7_7849_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_f105_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_7849_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_f105_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_f105_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l647_c2_0997_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l669_c7_7849] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l669_c7_7849] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l659_c7_b36b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l674_c7_20b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l665_c7_7f88] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;

     -- n16_MUX[uxn_opcodes_h_l665_c7_7f88] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l665_c7_7f88_cond <= VAR_n16_MUX_uxn_opcodes_h_l665_c7_7f88_cond;
     n16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue;
     n16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output := n16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l674_c7_20b0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_return_output := result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l669_c7_7849] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l669_c7_7849_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_7849_cond;
     tmp16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_7849_iftrue;
     tmp16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_7849_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_7849_return_output := tmp16_MUX_uxn_opcodes_h_l669_c7_7849_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l674_c7_20b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_7849_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_7849_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_20b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_7849_return_output;
     -- n16_MUX[uxn_opcodes_h_l659_c7_b36b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l659_c7_b36b_cond <= VAR_n16_MUX_uxn_opcodes_h_l659_c7_b36b_cond;
     n16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue;
     n16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output := n16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l655_c7_9d3a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l659_c7_b36b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l665_c7_7f88] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l665_c7_7f88] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_cond;
     tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue;
     tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output := tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l669_c7_7849] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l669_c7_7849] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l669_c7_7849] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_cond;
     result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_return_output := result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l665_c7_7f88] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_7849_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_7849_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_7849_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l659_c7_b36b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_cond;
     tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output := tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l659_c7_b36b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l647_c2_0997] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l659_c7_b36b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l665_c7_7f88] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l665_c7_7f88] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l655_c7_9d3a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;

     -- n16_MUX[uxn_opcodes_h_l655_c7_9d3a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond <= VAR_n16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond;
     n16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue;
     n16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output := n16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l665_c7_7f88] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_cond;
     result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_return_output := result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse := VAR_n16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_7f88_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;
     -- n16_MUX[uxn_opcodes_h_l647_c2_0997] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l647_c2_0997_cond <= VAR_n16_MUX_uxn_opcodes_h_l647_c2_0997_cond;
     n16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue;
     n16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l647_c2_0997_return_output := n16_MUX_uxn_opcodes_h_l647_c2_0997_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l647_c2_0997] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l659_c7_b36b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l659_c7_b36b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_return_output := result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l659_c7_b36b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l655_c7_9d3a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_cond;
     tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output := tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l655_c7_9d3a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l655_c7_9d3a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l647_c2_0997_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b36b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l647_c2_0997] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l655_c7_9d3a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l655_c7_9d3a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output := result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l655_c7_9d3a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l647_c2_0997] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l647_c2_0997] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l647_c2_0997_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_0997_cond;
     tmp16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_0997_iftrue;
     tmp16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_0997_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_0997_return_output := tmp16_MUX_uxn_opcodes_h_l647_c2_0997_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_9d3a_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_0997_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l647_c2_0997] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l647_c2_0997] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l647_c2_0997] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_cond;
     result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_return_output := result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l643_l711_DUPLICATE_855d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l643_l711_DUPLICATE_855d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_0997_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_0997_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l643_l711_DUPLICATE_855d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l643_l711_DUPLICATE_855d_return_output;
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
