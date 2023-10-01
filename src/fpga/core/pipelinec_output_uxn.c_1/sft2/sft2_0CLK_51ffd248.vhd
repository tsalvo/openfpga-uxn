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
-- Submodules: 114
entity sft2_0CLK_51ffd248 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_51ffd248;
architecture arch of sft2_0CLK_51ffd248 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1423_c6_7d17]
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1423_c1_a10b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1423_c2_b46c]
signal n16_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1423_c2_b46c]
signal t8_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1423_c2_b46c]
signal tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1423_c2_b46c]
signal result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1423_c2_b46c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c2_b46c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c2_b46c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1423_c2_b46c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1423_c2_b46c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c2_b46c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1423_c2_b46c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1424_c3_3cc7[uxn_opcodes_h_l1424_c3_3cc7]
signal printf_uxn_opcodes_h_l1424_c3_3cc7_uxn_opcodes_h_l1424_c3_3cc7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1431_c11_2eae]
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1431_c7_0160]
signal n16_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1431_c7_0160]
signal t8_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1431_c7_0160]
signal tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1431_c7_0160]
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1431_c7_0160]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c7_0160]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c7_0160]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1431_c7_0160]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c7_0160]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c7_0160]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1431_c7_0160]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1435_c11_8ccc]
signal BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1435_c7_738f]
signal n16_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1435_c7_738f]
signal t8_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1435_c7_738f]
signal tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1435_c7_738f]
signal result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1435_c7_738f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1435_c7_738f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1435_c7_738f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1435_c7_738f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1435_c7_738f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1435_c7_738f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1435_c7_738f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1440_c11_e3ba]
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1440_c7_924f]
signal n16_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1440_c7_924f]
signal tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1440_c7_924f]
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1440_c7_924f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1440_c7_924f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1440_c7_924f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1440_c7_924f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1440_c7_924f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1440_c7_924f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1440_c7_924f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1444_c11_67a2]
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1444_c7_4c15]
signal n16_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1444_c7_4c15]
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1444_c7_4c15]
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1444_c7_4c15]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1444_c7_4c15]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1444_c7_4c15]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1444_c7_4c15]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1444_c7_4c15]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1444_c7_4c15]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1444_c7_4c15]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1446_c3_30c8]
signal CONST_SL_8_uxn_opcodes_h_l1446_c3_30c8_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1446_c3_30c8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1450_c11_2371]
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1450_c7_8bcc]
signal n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1450_c7_8bcc]
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1450_c7_8bcc]
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1450_c7_8bcc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1450_c7_8bcc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1450_c7_8bcc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1450_c7_8bcc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1450_c7_8bcc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1450_c7_8bcc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1450_c7_8bcc]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1454_c11_8f5f]
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1454_c7_f150]
signal n16_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1454_c7_f150]
signal tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1454_c7_f150]
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1454_c7_f150]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1454_c7_f150]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1454_c7_f150]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1454_c7_f150]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1454_c7_f150]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1454_c7_f150]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1454_c7_f150]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1455_c3_f7de]
signal BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1458_c32_82f9]
signal BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1458_c32_2768]
signal BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1458_c32_289d]
signal MUX_uxn_opcodes_h_l1458_c32_289d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1458_c32_289d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1458_c32_289d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1458_c32_289d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1460_c11_2115]
signal BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1460_c7_285a]
signal tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1460_c7_285a]
signal result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1460_c7_285a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1460_c7_285a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1460_c7_285a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1460_c7_285a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1460_c7_285a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1461_c20_71dd]
signal BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l1461_c12_cf74]
signal BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l1461_c36_156b]
signal CONST_SR_4_uxn_opcodes_h_l1461_c36_156b_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l1461_c36_156b_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l1461_c12_2c82]
signal BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1467_c11_970c]
signal BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1467_c7_9703]
signal result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1467_c7_9703]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1467_c7_9703]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1467_c7_9703]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1467_c7_9703]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1470_c34_38e8]
signal CONST_SR_8_uxn_opcodes_h_l1470_c34_38e8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1470_c34_38e8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1472_c11_d3b7]
signal BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1472_c7_9a6d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1472_c7_9a6d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1472_c7_9a6d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_81ab( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17
BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_left,
BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_right,
BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_return_output);

-- n16_MUX_uxn_opcodes_h_l1423_c2_b46c
n16_MUX_uxn_opcodes_h_l1423_c2_b46c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1423_c2_b46c_cond,
n16_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue,
n16_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse,
n16_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output);

-- t8_MUX_uxn_opcodes_h_l1423_c2_b46c
t8_MUX_uxn_opcodes_h_l1423_c2_b46c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1423_c2_b46c_cond,
t8_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue,
t8_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse,
t8_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c
tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_cond,
tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c
result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output);

-- printf_uxn_opcodes_h_l1424_c3_3cc7_uxn_opcodes_h_l1424_c3_3cc7
printf_uxn_opcodes_h_l1424_c3_3cc7_uxn_opcodes_h_l1424_c3_3cc7 : entity work.printf_uxn_opcodes_h_l1424_c3_3cc7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1424_c3_3cc7_uxn_opcodes_h_l1424_c3_3cc7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_left,
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_right,
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_return_output);

-- n16_MUX_uxn_opcodes_h_l1431_c7_0160
n16_MUX_uxn_opcodes_h_l1431_c7_0160 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1431_c7_0160_cond,
n16_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue,
n16_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse,
n16_MUX_uxn_opcodes_h_l1431_c7_0160_return_output);

-- t8_MUX_uxn_opcodes_h_l1431_c7_0160
t8_MUX_uxn_opcodes_h_l1431_c7_0160 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1431_c7_0160_cond,
t8_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue,
t8_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse,
t8_MUX_uxn_opcodes_h_l1431_c7_0160_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1431_c7_0160
tmp16_MUX_uxn_opcodes_h_l1431_c7_0160 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_cond,
tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue,
tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse,
tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_cond,
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc
BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_left,
BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_right,
BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_return_output);

-- n16_MUX_uxn_opcodes_h_l1435_c7_738f
n16_MUX_uxn_opcodes_h_l1435_c7_738f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1435_c7_738f_cond,
n16_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue,
n16_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse,
n16_MUX_uxn_opcodes_h_l1435_c7_738f_return_output);

-- t8_MUX_uxn_opcodes_h_l1435_c7_738f
t8_MUX_uxn_opcodes_h_l1435_c7_738f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1435_c7_738f_cond,
t8_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue,
t8_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse,
t8_MUX_uxn_opcodes_h_l1435_c7_738f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1435_c7_738f
tmp16_MUX_uxn_opcodes_h_l1435_c7_738f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_cond,
tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f
result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_left,
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_right,
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_return_output);

-- n16_MUX_uxn_opcodes_h_l1440_c7_924f
n16_MUX_uxn_opcodes_h_l1440_c7_924f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1440_c7_924f_cond,
n16_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue,
n16_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse,
n16_MUX_uxn_opcodes_h_l1440_c7_924f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1440_c7_924f
tmp16_MUX_uxn_opcodes_h_l1440_c7_924f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_cond,
tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_left,
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_right,
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_return_output);

-- n16_MUX_uxn_opcodes_h_l1444_c7_4c15
n16_MUX_uxn_opcodes_h_l1444_c7_4c15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1444_c7_4c15_cond,
n16_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue,
n16_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse,
n16_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15
tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_cond,
tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue,
tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse,
tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_cond,
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1446_c3_30c8
CONST_SL_8_uxn_opcodes_h_l1446_c3_30c8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1446_c3_30c8_x,
CONST_SL_8_uxn_opcodes_h_l1446_c3_30c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_left,
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_right,
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_return_output);

-- n16_MUX_uxn_opcodes_h_l1450_c7_8bcc
n16_MUX_uxn_opcodes_h_l1450_c7_8bcc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond,
n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue,
n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse,
n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc
tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond,
tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_left,
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_right,
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_return_output);

-- n16_MUX_uxn_opcodes_h_l1454_c7_f150
n16_MUX_uxn_opcodes_h_l1454_c7_f150 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1454_c7_f150_cond,
n16_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue,
n16_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse,
n16_MUX_uxn_opcodes_h_l1454_c7_f150_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1454_c7_f150
tmp16_MUX_uxn_opcodes_h_l1454_c7_f150 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_cond,
tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue,
tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse,
tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_cond,
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de
BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_left,
BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_right,
BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9
BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_left,
BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_right,
BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768
BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_left,
BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_right,
BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_return_output);

-- MUX_uxn_opcodes_h_l1458_c32_289d
MUX_uxn_opcodes_h_l1458_c32_289d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1458_c32_289d_cond,
MUX_uxn_opcodes_h_l1458_c32_289d_iftrue,
MUX_uxn_opcodes_h_l1458_c32_289d_iffalse,
MUX_uxn_opcodes_h_l1458_c32_289d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115
BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_left,
BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_right,
BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1460_c7_285a
tmp16_MUX_uxn_opcodes_h_l1460_c7_285a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_cond,
tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a
result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd
BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_left,
BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_right,
BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74
BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_left,
BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_right,
BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_return_output);

-- CONST_SR_4_uxn_opcodes_h_l1461_c36_156b
CONST_SR_4_uxn_opcodes_h_l1461_c36_156b : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l1461_c36_156b_x,
CONST_SR_4_uxn_opcodes_h_l1461_c36_156b_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82
BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_left,
BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_right,
BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_left,
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_right,
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_cond,
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1470_c34_38e8
CONST_SR_8_uxn_opcodes_h_l1470_c34_38e8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1470_c34_38e8_x,
CONST_SR_8_uxn_opcodes_h_l1470_c34_38e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7
BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_left,
BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_right,
BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output);



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
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_return_output,
 n16_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
 t8_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_return_output,
 n16_MUX_uxn_opcodes_h_l1431_c7_0160_return_output,
 t8_MUX_uxn_opcodes_h_l1431_c7_0160_return_output,
 tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_return_output,
 n16_MUX_uxn_opcodes_h_l1435_c7_738f_return_output,
 t8_MUX_uxn_opcodes_h_l1435_c7_738f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_return_output,
 n16_MUX_uxn_opcodes_h_l1440_c7_924f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_return_output,
 n16_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output,
 tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output,
 CONST_SL_8_uxn_opcodes_h_l1446_c3_30c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_return_output,
 n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_return_output,
 n16_MUX_uxn_opcodes_h_l1454_c7_f150_return_output,
 tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_return_output,
 MUX_uxn_opcodes_h_l1458_c32_289d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_return_output,
 tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_return_output,
 BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_return_output,
 CONST_SR_4_uxn_opcodes_h_l1461_c36_156b_return_output,
 BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_return_output,
 CONST_SR_8_uxn_opcodes_h_l1470_c34_38e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1427_c3_cacc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1424_c3_3cc7_uxn_opcodes_h_l1424_c3_3cc7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1433_c3_e269 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1438_c3_7cbc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_e784 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_e722 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_30c8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_30c8_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1452_c3_3c37 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1454_c7_f150_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1458_c32_289d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1458_c32_289d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1458_c32_289d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1458_c32_289d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1464_c3_5f00 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_156b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_156b_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1465_c24_53c2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1469_c3_1773 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_38e8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_38e8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1470_c24_7502_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1467_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_0fb9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1431_l1460_l1423_l1450_l1444_l1440_DUPLICATE_b70d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_3093_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1472_l1435_l1431_l1454_l1450_l1444_l1440_DUPLICATE_9290_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_c87c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_46f0_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1455_l1445_DUPLICATE_1d28_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1467_l1454_DUPLICATE_b5ae_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1418_l1478_DUPLICATE_1fda_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1469_c3_1773 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1469_c3_1773;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1464_c3_5f00 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1464_c3_5f00;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_e784 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_e784;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1427_c3_cacc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1427_c3_cacc;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_e722 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_e722;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1458_c32_289d_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1438_c3_7cbc := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1438_c3_7cbc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1433_c3_e269 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1433_c3_e269;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1458_c32_289d_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1452_c3_3c37 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1452_c3_3c37;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_right := to_unsigned(9, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_left := n16;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_156b_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_38e8_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1454_c11_8f5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1450_c11_2371] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_left;
     BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_return_output := BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1467_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_0fb9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1467_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_0fb9_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_46f0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_46f0_return_output := result.is_stack_index_flipped;

     -- CONST_SR_8[uxn_opcodes_h_l1470_c34_38e8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1470_c34_38e8_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_38e8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_38e8_return_output := CONST_SR_8_uxn_opcodes_h_l1470_c34_38e8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1460_c11_2115] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_left;
     BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_return_output := BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1461_c20_71dd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_left;
     BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_return_output := BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1467_c11_970c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1458_c32_82f9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_left;
     BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_return_output := BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_c87c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_c87c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1431_c11_2eae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1444_c11_67a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1435_c11_8ccc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1467_l1454_DUPLICATE_b5ae LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1467_l1454_DUPLICATE_b5ae_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1472_l1435_l1431_l1454_l1450_l1444_l1440_DUPLICATE_9290 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1472_l1435_l1431_l1454_l1450_l1444_l1440_DUPLICATE_9290_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1455_l1445_DUPLICATE_1d28 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1455_l1445_DUPLICATE_1d28_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_4[uxn_opcodes_h_l1461_c36_156b] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l1461_c36_156b_x <= VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_156b_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_156b_return_output := CONST_SR_4_uxn_opcodes_h_l1461_c36_156b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1423_c6_7d17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_left;
     BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output := BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1472_c11_d3b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_3093 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_3093_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1431_l1460_l1423_l1450_l1444_l1440_DUPLICATE_b70d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1431_l1460_l1423_l1450_l1444_l1440_DUPLICATE_b70d_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1440_c11_e3ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1454_c7_f150] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1454_c7_f150_return_output := result.is_stack_read;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_82f9_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_right := VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_71dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1423_c2_b46c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1423_c2_b46c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_7d17_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1431_c7_0160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1431_c7_0160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_2eae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1435_c7_738f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1435_c7_738f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_8ccc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1440_c7_924f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_e3ba_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4c15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_67a2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_2371_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_f150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_8f5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_2115_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_970c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_d3b7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1455_l1445_DUPLICATE_1d28_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_30c8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1455_l1445_DUPLICATE_1d28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_3093_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_3093_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_3093_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_3093_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_3093_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_3093_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_3093_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_c87c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_c87c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_c87c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_c87c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_c87c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_c87c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_c87c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_c87c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_c87c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1431_l1460_l1423_l1450_l1444_l1440_DUPLICATE_b70d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1431_l1460_l1423_l1450_l1444_l1440_DUPLICATE_b70d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1431_l1460_l1423_l1450_l1444_l1440_DUPLICATE_b70d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1431_l1460_l1423_l1450_l1444_l1440_DUPLICATE_b70d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1431_l1460_l1423_l1450_l1444_l1440_DUPLICATE_b70d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1431_l1460_l1423_l1450_l1444_l1440_DUPLICATE_b70d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1431_l1460_l1423_l1450_l1444_l1440_DUPLICATE_b70d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_46f0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_46f0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_46f0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_46f0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_46f0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_46f0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_46f0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_46f0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1472_l1435_l1467_l1431_l1460_l1454_l1450_l1444_l1440_DUPLICATE_46f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1472_l1435_l1431_l1454_l1450_l1444_l1440_DUPLICATE_9290_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1472_l1435_l1431_l1454_l1450_l1444_l1440_DUPLICATE_9290_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1472_l1435_l1431_l1454_l1450_l1444_l1440_DUPLICATE_9290_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1472_l1435_l1431_l1454_l1450_l1444_l1440_DUPLICATE_9290_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1472_l1435_l1431_l1454_l1450_l1444_l1440_DUPLICATE_9290_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1472_l1435_l1431_l1454_l1450_l1444_l1440_DUPLICATE_9290_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1472_l1435_l1431_l1454_l1450_l1444_l1440_DUPLICATE_9290_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1467_l1454_DUPLICATE_b5ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1467_l1454_DUPLICATE_b5ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1467_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_0fb9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1467_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_0fb9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1467_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_0fb9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1467_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_0fb9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1467_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_0fb9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1467_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_0fb9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1467_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_0fb9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1467_l1431_l1423_l1454_l1450_l1444_l1440_DUPLICATE_0fb9_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_right := VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_156b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1454_c7_f150_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1454_c7_f150] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1460_c7_285a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1467_c7_9703] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1472_c7_9a6d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1446_c3_30c8] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1446_c3_30c8_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_30c8_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_30c8_return_output := CONST_SL_8_uxn_opcodes_h_l1446_c3_30c8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1455_c3_f7de] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_left;
     BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_return_output := BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l1461_c12_cf74] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_left;
     BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_return_output := BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1458_c32_2768] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_left;
     BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_return_output := BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1472_c7_9a6d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1472_c7_9a6d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1423_c1_a10b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1470_c24_7502] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1470_c24_7502_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_38e8_return_output);

     -- t8_MUX[uxn_opcodes_h_l1435_c7_738f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1435_c7_738f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1435_c7_738f_cond;
     t8_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue;
     t8_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1435_c7_738f_return_output := t8_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1458_c32_289d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_2768_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_f7de_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_left := VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_cf74_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1470_c24_7502_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_30c8_return_output;
     VAR_printf_uxn_opcodes_h_l1424_c3_3cc7_uxn_opcodes_h_l1424_c3_3cc7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_a10b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_285a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_9a6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_9703_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1454_c7_f150] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1450_c7_8bcc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1454_c7_f150] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1454_c7_f150_cond <= VAR_n16_MUX_uxn_opcodes_h_l1454_c7_f150_cond;
     n16_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue;
     n16_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_f150_return_output := n16_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1467_c7_9703] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_return_output;

     -- MUX[uxn_opcodes_h_l1458_c32_289d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1458_c32_289d_cond <= VAR_MUX_uxn_opcodes_h_l1458_c32_289d_cond;
     MUX_uxn_opcodes_h_l1458_c32_289d_iftrue <= VAR_MUX_uxn_opcodes_h_l1458_c32_289d_iftrue;
     MUX_uxn_opcodes_h_l1458_c32_289d_iffalse <= VAR_MUX_uxn_opcodes_h_l1458_c32_289d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1458_c32_289d_return_output := MUX_uxn_opcodes_h_l1458_c32_289d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1431_c7_0160] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1431_c7_0160_cond <= VAR_t8_MUX_uxn_opcodes_h_l1431_c7_0160_cond;
     t8_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue;
     t8_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1431_c7_0160_return_output := t8_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;

     -- printf_uxn_opcodes_h_l1424_c3_3cc7[uxn_opcodes_h_l1424_c3_3cc7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1424_c3_3cc7_uxn_opcodes_h_l1424_c3_3cc7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1424_c3_3cc7_uxn_opcodes_h_l1424_c3_3cc7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l1467_c7_9703] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_return_output := result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1467_c7_9703] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1467_c7_9703] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1460_c7_285a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l1461_c12_2c82] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_left;
     BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_return_output := BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue := VAR_MUX_uxn_opcodes_h_l1458_c32_289d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_9703_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_9703_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_9703_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_285a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_9703_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;
     -- n16_MUX[uxn_opcodes_h_l1450_c7_8bcc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond;
     n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue;
     n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output := n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1460_c7_285a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_cond;
     tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_return_output := tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1460_c7_285a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1454_c7_f150] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1465_c24_53c2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1465_c24_53c2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_2c82_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1444_c7_4c15] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1454_c7_f150] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1460_c7_285a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1460_c7_285a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1423_c2_b46c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1423_c2_b46c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1423_c2_b46c_cond;
     t8_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue;
     t8_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output := t8_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1450_c7_8bcc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;

     -- Submodule level 4
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1465_c24_53c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_285a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_285a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_285a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_285a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1454_c7_f150] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;

     -- n16_MUX[uxn_opcodes_h_l1444_c7_4c15] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1444_c7_4c15_cond <= VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4c15_cond;
     n16_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue;
     n16_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output := n16_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1450_c7_8bcc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1454_c7_f150] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1450_c7_8bcc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1460_c7_285a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1440_c7_924f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1454_c7_f150] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_cond;
     tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_return_output := tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1454_c7_f150] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1444_c7_4c15] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_285a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1435_c7_738f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1450_c7_8bcc] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1450_c7_8bcc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond;
     tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output := tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1440_c7_924f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1440_c7_924f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1440_c7_924f_cond;
     n16_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue;
     n16_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1440_c7_924f_return_output := n16_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1450_c7_8bcc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1454_c7_f150] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_return_output := result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1450_c7_8bcc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1444_c7_4c15] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1444_c7_4c15] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1440_c7_924f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_f150_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;
     -- n16_MUX[uxn_opcodes_h_l1435_c7_738f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1435_c7_738f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1435_c7_738f_cond;
     n16_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue;
     n16_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1435_c7_738f_return_output := n16_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1444_c7_4c15] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1444_c7_4c15] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1444_c7_4c15] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_cond;
     tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output := tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1440_c7_924f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1431_c7_0160] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1435_c7_738f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1440_c7_924f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1450_c7_8bcc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1444_c7_4c15] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8bcc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1440_c7_924f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1431_c7_0160] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1431_c7_0160_cond <= VAR_n16_MUX_uxn_opcodes_h_l1431_c7_0160_cond;
     n16_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue;
     n16_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1431_c7_0160_return_output := n16_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1440_c7_924f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1435_c7_738f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1440_c7_924f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1431_c7_0160] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1440_c7_924f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_cond;
     tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_return_output := tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1423_c2_b46c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1435_c7_738f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1444_c7_4c15] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output := result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4c15_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1435_c7_738f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1435_c7_738f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c7_0160] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1435_c7_738f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1440_c7_924f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1435_c7_738f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_cond;
     tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_return_output := tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1423_c2_b46c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1423_c2_b46c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1423_c2_b46c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1423_c2_b46c_cond;
     n16_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue;
     n16_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output := n16_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c7_0160] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_924f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1431_c7_0160] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_cond;
     tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_return_output := tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c2_b46c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c7_0160] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1435_c7_738f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1431_c7_0160] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1423_c2_b46c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c7_0160] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_738f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1423_c2_b46c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_cond;
     tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output := tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c2_b46c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1431_c7_0160] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_return_output := result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c2_b46c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1423_c2_b46c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output;

     -- Submodule level 11
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_0160_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1423_c2_b46c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1418_l1478_DUPLICATE_1fda LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1418_l1478_DUPLICATE_1fda_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_81ab(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_b46c_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1418_l1478_DUPLICATE_1fda_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1418_l1478_DUPLICATE_1fda_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
