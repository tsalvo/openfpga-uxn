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
entity and2_0CLK_b14a5a36 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_b14a5a36;
architecture arch of and2_0CLK_b14a5a36 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l718_c6_5a47]
signal BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l718_c1_0eec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l718_c2_b6f9]
signal n16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l718_c2_b6f9]
signal tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l718_c2_b6f9]
signal t16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l718_c2_b6f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l718_c2_b6f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l718_c2_b6f9]
signal result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l718_c2_b6f9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l718_c2_b6f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l718_c2_b6f9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l718_c2_b6f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l718_c2_b6f9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l719_c3_4fe4[uxn_opcodes_h_l719_c3_4fe4]
signal printf_uxn_opcodes_h_l719_c3_4fe4_uxn_opcodes_h_l719_c3_4fe4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l726_c11_a12c]
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l726_c7_d6d2]
signal n16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l726_c7_d6d2]
signal tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l726_c7_d6d2]
signal t16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c7_d6d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l726_c7_d6d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l726_c7_d6d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l726_c7_d6d2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l726_c7_d6d2]
signal result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c7_d6d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l726_c7_d6d2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l730_c11_32c8]
signal BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l730_c7_035c]
signal n16_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l730_c7_035c]
signal tmp16_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l730_c7_035c]
signal t16_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l730_c7_035c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l730_c7_035c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l730_c7_035c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l730_c7_035c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l730_c7_035c]
signal result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l730_c7_035c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l730_c7_035c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l736_c11_7ab0]
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l736_c7_d28f]
signal n16_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l736_c7_d28f]
signal tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l736_c7_d28f]
signal t16_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l736_c7_d28f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l736_c7_d28f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l736_c7_d28f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l736_c7_d28f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l736_c7_d28f]
signal result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l736_c7_d28f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l736_c7_d28f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l740_c11_903d]
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l740_c7_98fc]
signal n16_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l740_c7_98fc]
signal tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l740_c7_98fc]
signal t16_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l740_c7_98fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l740_c7_98fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l740_c7_98fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l740_c7_98fc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l740_c7_98fc]
signal result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l740_c7_98fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l740_c7_98fc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l741_c3_6264]
signal BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l745_c11_a046]
signal BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l745_c7_6b48]
signal n16_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l745_c7_6b48]
signal tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l745_c7_6b48]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l745_c7_6b48]
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l745_c7_6b48]
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l745_c7_6b48]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l745_c7_6b48]
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l745_c7_6b48]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l745_c7_6b48]
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l749_c11_9bc5]
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l749_c7_91b9]
signal n16_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l749_c7_91b9]
signal tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l749_c7_91b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l749_c7_91b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l749_c7_91b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l749_c7_91b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l749_c7_91b9]
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l749_c7_91b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l749_c7_91b9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l755_c11_465e]
signal BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l755_c7_a5ec]
signal n16_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l755_c7_a5ec]
signal tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l755_c7_a5ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l755_c7_a5ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l755_c7_a5ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l755_c7_a5ec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l755_c7_a5ec]
signal result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l755_c7_a5ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l755_c7_a5ec]
signal result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l759_c11_55f0]
signal BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l759_c7_57b7]
signal n16_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l759_c7_57b7]
signal tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l759_c7_57b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l759_c7_57b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l759_c7_57b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l759_c7_57b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l759_c7_57b7]
signal result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l759_c7_57b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l759_c7_57b7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l760_c3_2010]
signal BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l761_c11_e4a6]
signal BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l764_c32_f351]
signal BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l764_c32_213b]
signal BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l764_c32_adf6]
signal MUX_uxn_opcodes_h_l764_c32_adf6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l764_c32_adf6_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l764_c32_adf6_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l764_c32_adf6_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l766_c11_8670]
signal BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l766_c7_7703]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l766_c7_7703]
signal result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l766_c7_7703]
signal result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l766_c7_7703]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l766_c7_7703]
signal result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l772_c11_494c]
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l772_c7_5fc4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l772_c7_5fc4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l772_c7_5fc4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l772_c7_5fc4]
signal result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l775_c34_7651]
signal CONST_SR_8_uxn_opcodes_h_l775_c34_7651_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l775_c34_7651_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l777_c11_8bf5]
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_4e19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_4e19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47
BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_left,
BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_right,
BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_return_output);

-- n16_MUX_uxn_opcodes_h_l718_c2_b6f9
n16_MUX_uxn_opcodes_h_l718_c2_b6f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond,
n16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue,
n16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse,
n16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9
tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond,
tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue,
tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse,
tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output);

-- t16_MUX_uxn_opcodes_h_l718_c2_b6f9
t16_MUX_uxn_opcodes_h_l718_c2_b6f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond,
t16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue,
t16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse,
t16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9
result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9
result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9
result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_cond,
result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9
result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output);

-- printf_uxn_opcodes_h_l719_c3_4fe4_uxn_opcodes_h_l719_c3_4fe4
printf_uxn_opcodes_h_l719_c3_4fe4_uxn_opcodes_h_l719_c3_4fe4 : entity work.printf_uxn_opcodes_h_l719_c3_4fe4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l719_c3_4fe4_uxn_opcodes_h_l719_c3_4fe4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c
BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_left,
BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_right,
BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_return_output);

-- n16_MUX_uxn_opcodes_h_l726_c7_d6d2
n16_MUX_uxn_opcodes_h_l726_c7_d6d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond,
n16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue,
n16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse,
n16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2
tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond,
tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue,
tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse,
tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output);

-- t16_MUX_uxn_opcodes_h_l726_c7_d6d2
t16_MUX_uxn_opcodes_h_l726_c7_d6d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond,
t16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue,
t16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse,
t16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2
result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2
result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_cond,
result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2
result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8
BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_left,
BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_right,
BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_return_output);

-- n16_MUX_uxn_opcodes_h_l730_c7_035c
n16_MUX_uxn_opcodes_h_l730_c7_035c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l730_c7_035c_cond,
n16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue,
n16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse,
n16_MUX_uxn_opcodes_h_l730_c7_035c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l730_c7_035c
tmp16_MUX_uxn_opcodes_h_l730_c7_035c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l730_c7_035c_cond,
tmp16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue,
tmp16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse,
tmp16_MUX_uxn_opcodes_h_l730_c7_035c_return_output);

-- t16_MUX_uxn_opcodes_h_l730_c7_035c
t16_MUX_uxn_opcodes_h_l730_c7_035c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l730_c7_035c_cond,
t16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue,
t16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse,
t16_MUX_uxn_opcodes_h_l730_c7_035c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c
result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c
result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_cond,
result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0
BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_left,
BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_right,
BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_return_output);

-- n16_MUX_uxn_opcodes_h_l736_c7_d28f
n16_MUX_uxn_opcodes_h_l736_c7_d28f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l736_c7_d28f_cond,
n16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue,
n16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse,
n16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l736_c7_d28f
tmp16_MUX_uxn_opcodes_h_l736_c7_d28f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_cond,
tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue,
tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse,
tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output);

-- t16_MUX_uxn_opcodes_h_l736_c7_d28f
t16_MUX_uxn_opcodes_h_l736_c7_d28f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l736_c7_d28f_cond,
t16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue,
t16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse,
t16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f
result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f
result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_cond,
result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f
result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d
BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_left,
BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_right,
BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_return_output);

-- n16_MUX_uxn_opcodes_h_l740_c7_98fc
n16_MUX_uxn_opcodes_h_l740_c7_98fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l740_c7_98fc_cond,
n16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue,
n16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse,
n16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l740_c7_98fc
tmp16_MUX_uxn_opcodes_h_l740_c7_98fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_cond,
tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue,
tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse,
tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output);

-- t16_MUX_uxn_opcodes_h_l740_c7_98fc
t16_MUX_uxn_opcodes_h_l740_c7_98fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l740_c7_98fc_cond,
t16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue,
t16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse,
t16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc
result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc
result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_cond,
result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l741_c3_6264
BIN_OP_OR_uxn_opcodes_h_l741_c3_6264 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_left,
BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_right,
BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046
BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_left,
BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_right,
BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_return_output);

-- n16_MUX_uxn_opcodes_h_l745_c7_6b48
n16_MUX_uxn_opcodes_h_l745_c7_6b48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l745_c7_6b48_cond,
n16_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue,
n16_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse,
n16_MUX_uxn_opcodes_h_l745_c7_6b48_return_output);

-- tmp16_MUX_uxn_opcodes_h_l745_c7_6b48
tmp16_MUX_uxn_opcodes_h_l745_c7_6b48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_cond,
tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue,
tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse,
tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48
result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_cond,
result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5
BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_left,
BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_right,
BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_return_output);

-- n16_MUX_uxn_opcodes_h_l749_c7_91b9
n16_MUX_uxn_opcodes_h_l749_c7_91b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l749_c7_91b9_cond,
n16_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue,
n16_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse,
n16_MUX_uxn_opcodes_h_l749_c7_91b9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l749_c7_91b9
tmp16_MUX_uxn_opcodes_h_l749_c7_91b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_cond,
tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue,
tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse,
tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9
result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_cond,
result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e
BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_left,
BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_right,
BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_return_output);

-- n16_MUX_uxn_opcodes_h_l755_c7_a5ec
n16_MUX_uxn_opcodes_h_l755_c7_a5ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l755_c7_a5ec_cond,
n16_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue,
n16_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse,
n16_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec
tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_cond,
tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue,
tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse,
tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec
result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec
result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_cond,
result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0
BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_left,
BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_right,
BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_return_output);

-- n16_MUX_uxn_opcodes_h_l759_c7_57b7
n16_MUX_uxn_opcodes_h_l759_c7_57b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l759_c7_57b7_cond,
n16_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue,
n16_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse,
n16_MUX_uxn_opcodes_h_l759_c7_57b7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l759_c7_57b7
tmp16_MUX_uxn_opcodes_h_l759_c7_57b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_cond,
tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue,
tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse,
tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7
result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_cond,
result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l760_c3_2010
BIN_OP_OR_uxn_opcodes_h_l760_c3_2010 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_left,
BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_right,
BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6
BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_left,
BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_right,
BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l764_c32_f351
BIN_OP_AND_uxn_opcodes_h_l764_c32_f351 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_left,
BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_right,
BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l764_c32_213b
BIN_OP_GT_uxn_opcodes_h_l764_c32_213b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_left,
BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_right,
BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_return_output);

-- MUX_uxn_opcodes_h_l764_c32_adf6
MUX_uxn_opcodes_h_l764_c32_adf6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l764_c32_adf6_cond,
MUX_uxn_opcodes_h_l764_c32_adf6_iftrue,
MUX_uxn_opcodes_h_l764_c32_adf6_iffalse,
MUX_uxn_opcodes_h_l764_c32_adf6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670
BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_left,
BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_right,
BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703
result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703
result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703
result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703
result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_cond,
result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c
BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_left,
BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_right,
BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4
result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_cond,
result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l775_c34_7651
CONST_SR_8_uxn_opcodes_h_l775_c34_7651 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l775_c34_7651_x,
CONST_SR_8_uxn_opcodes_h_l775_c34_7651_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5
BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_left,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_right,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8
CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_return_output,
 n16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
 tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
 t16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_return_output,
 n16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output,
 tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output,
 t16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_return_output,
 n16_MUX_uxn_opcodes_h_l730_c7_035c_return_output,
 tmp16_MUX_uxn_opcodes_h_l730_c7_035c_return_output,
 t16_MUX_uxn_opcodes_h_l730_c7_035c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_return_output,
 n16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output,
 tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output,
 t16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_return_output,
 n16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output,
 tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output,
 t16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_return_output,
 n16_MUX_uxn_opcodes_h_l745_c7_6b48_return_output,
 tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_return_output,
 n16_MUX_uxn_opcodes_h_l749_c7_91b9_return_output,
 tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_return_output,
 n16_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output,
 tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_return_output,
 n16_MUX_uxn_opcodes_h_l759_c7_57b7_return_output,
 tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_return_output,
 BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_return_output,
 BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_return_output,
 BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_return_output,
 MUX_uxn_opcodes_h_l764_c32_adf6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output,
 CONST_SR_8_uxn_opcodes_h_l775_c34_7651_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l722_c3_8a9c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l719_c3_4fe4_uxn_opcodes_h_l719_c3_4fe4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l728_c3_2fd9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_ba07 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_f3a6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l743_c3_d8be : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_ed53 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l753_c3_bf24 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l757_c3_f652 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_c7_57b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l764_c32_adf6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l764_c32_adf6_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l764_c32_adf6_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l764_c32_adf6_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_c95c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l770_c24_8c1b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_219f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_7651_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_7651_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c24_6bbd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_a683_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_11ab_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_4267_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_0172_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_bfa5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l741_l731_l760_l750_DUPLICATE_0366_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l759_l772_DUPLICATE_465d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l782_l714_DUPLICATE_92c9_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_right := to_unsigned(10, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_c95c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_c95c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l764_c32_adf6_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_ba07 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_ba07;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l728_c3_2fd9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l728_c3_2fd9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l722_c3_8a9c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l722_c3_8a9c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_ed53 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_ed53;
     VAR_MUX_uxn_opcodes_h_l764_c32_adf6_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l743_c3_d8be := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l743_c3_d8be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l753_c3_bf24 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l753_c3_bf24;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_f3a6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_f3a6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_219f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_219f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l757_c3_f652 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l757_c3_f652;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_right := to_unsigned(8, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_7651_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l766_c11_8670] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_left;
     BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_return_output := BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_4267 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_4267_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l759_l772_DUPLICATE_465d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l759_l772_DUPLICATE_465d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l736_c11_7ab0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_left;
     BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_return_output := BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_0172 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_0172_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l741_l731_l760_l750_DUPLICATE_0366 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l741_l731_l760_l750_DUPLICATE_0366_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l759_c7_57b7] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_c7_57b7_return_output := result.is_stack_read;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l718_c2_b6f9] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l718_c2_b6f9_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l730_c11_32c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l740_c11_903d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_left;
     BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_return_output := BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l775_c34_7651] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l775_c34_7651_x <= VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_7651_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_7651_return_output := CONST_SR_8_uxn_opcodes_h_l775_c34_7651_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_a683 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_a683_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l749_c11_9bc5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_left;
     BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_return_output := BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l718_c6_5a47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_left;
     BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output := BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l772_c11_494c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_left;
     BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_return_output := BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l759_c11_55f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l726_c11_a12c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_left;
     BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_return_output := BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l770_c24_8c1b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l770_c24_8c1b_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l745_c11_a046] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_left;
     BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_return_output := BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_bfa5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_bfa5_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l764_c32_f351] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_left;
     BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_return_output := BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l755_c11_465e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_left;
     BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_return_output := BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_11ab LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_11ab_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l777_c11_8bf5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_left;
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_return_output := BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_f351_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_5a47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_a12c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l730_c7_035c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l730_c7_035c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_035c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_32c8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l736_c7_d28f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_d28f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_7ab0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l740_c7_98fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_98fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_903d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l745_c7_6b48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_a046_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l749_c7_91b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_9bc5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l755_c7_a5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_465e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l759_c7_57b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_55f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_8670_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_494c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_8bf5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l741_l731_l760_l750_DUPLICATE_0366_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l741_l731_l760_l750_DUPLICATE_0366_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l741_l731_l760_l750_DUPLICATE_0366_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l770_c24_8c1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_11ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_11ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_11ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_11ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_11ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_11ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_11ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_11ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_11ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_0172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_0172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_0172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_0172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_0172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_0172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_0172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_0172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_0172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_0172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_0172_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_4267_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_4267_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_4267_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_4267_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_4267_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_4267_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_4267_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_4267_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_4267_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_bfa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_bfa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_bfa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_bfa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_bfa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_bfa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_bfa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_bfa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_bfa5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l759_l772_DUPLICATE_465d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l759_l772_DUPLICATE_465d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_a683_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_a683_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_a683_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_a683_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_a683_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_a683_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_a683_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_a683_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_a683_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_a683_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l718_c2_b6f9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_c7_57b7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l718_c1_0eec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l772_c7_5fc4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l766_c7_7703] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_4e19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l718_c2_b6f9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l759_c7_57b7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_4e19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l741_c3_6264] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_left;
     BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_return_output := BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l764_c32_213b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_left;
     BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_return_output := BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l775_c24_6bbd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c24_6bbd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_7651_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l760_c3_2010] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_left;
     BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_return_output := BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l764_c32_adf6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_213b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_6264_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_right := VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_2010_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c24_6bbd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l732_l751_DUPLICATE_98e8_return_output;
     VAR_printf_uxn_opcodes_h_l719_c3_4fe4_uxn_opcodes_h_l719_c3_4fe4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_0eec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_4e19_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_7703_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_4e19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l755_c7_a5ec] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l759_c7_57b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;

     -- MUX[uxn_opcodes_h_l764_c32_adf6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l764_c32_adf6_cond <= VAR_MUX_uxn_opcodes_h_l764_c32_adf6_cond;
     MUX_uxn_opcodes_h_l764_c32_adf6_iftrue <= VAR_MUX_uxn_opcodes_h_l764_c32_adf6_iftrue;
     MUX_uxn_opcodes_h_l764_c32_adf6_iffalse <= VAR_MUX_uxn_opcodes_h_l764_c32_adf6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l764_c32_adf6_return_output := MUX_uxn_opcodes_h_l764_c32_adf6_return_output;

     -- n16_MUX[uxn_opcodes_h_l759_c7_57b7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l759_c7_57b7_cond <= VAR_n16_MUX_uxn_opcodes_h_l759_c7_57b7_cond;
     n16_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue;
     n16_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l759_c7_57b7_return_output := n16_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;

     -- t16_MUX[uxn_opcodes_h_l740_c7_98fc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l740_c7_98fc_cond <= VAR_t16_MUX_uxn_opcodes_h_l740_c7_98fc_cond;
     t16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue;
     t16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output := t16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l766_c7_7703] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l761_c11_e4a6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_left;
     BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_return_output := BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l772_c7_5fc4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output := result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l772_c7_5fc4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l772_c7_5fc4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output;

     -- printf_uxn_opcodes_h_l719_c3_4fe4[uxn_opcodes_h_l719_c3_4fe4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l719_c3_4fe4_uxn_opcodes_h_l719_c3_4fe4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l719_c3_4fe4_uxn_opcodes_h_l719_c3_4fe4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_e4a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue := VAR_MUX_uxn_opcodes_h_l764_c32_adf6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse := VAR_n16_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_7703_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_5fc4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l749_c7_91b9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l759_c7_57b7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_cond;
     tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_return_output := tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l759_c7_57b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l766_c7_7703] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l766_c7_7703] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_cond;
     result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_return_output := result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_return_output;

     -- t16_MUX[uxn_opcodes_h_l736_c7_d28f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l736_c7_d28f_cond <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_d28f_cond;
     t16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue;
     t16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output := t16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l766_c7_7703] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_return_output;

     -- n16_MUX[uxn_opcodes_h_l755_c7_a5ec] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l755_c7_a5ec_cond <= VAR_n16_MUX_uxn_opcodes_h_l755_c7_a5ec_cond;
     n16_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue;
     n16_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output := n16_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l759_c7_57b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l755_c7_a5ec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_7703_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_7703_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_7703_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l759_c7_57b7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_return_output := result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l755_c7_a5ec] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_cond;
     tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue;
     tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output := tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l759_c7_57b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l755_c7_a5ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l749_c7_91b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l755_c7_a5ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l759_c7_57b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;

     -- n16_MUX[uxn_opcodes_h_l749_c7_91b9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l749_c7_91b9_cond <= VAR_n16_MUX_uxn_opcodes_h_l749_c7_91b9_cond;
     n16_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue;
     n16_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l749_c7_91b9_return_output := n16_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;

     -- t16_MUX[uxn_opcodes_h_l730_c7_035c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l730_c7_035c_cond <= VAR_t16_MUX_uxn_opcodes_h_l730_c7_035c_cond;
     t16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue;
     t16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l730_c7_035c_return_output := t16_MUX_uxn_opcodes_h_l730_c7_035c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l745_c7_6b48] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse := VAR_n16_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_57b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l730_c7_035c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l740_c7_98fc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l755_c7_a5ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l755_c7_a5ec] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_cond;
     result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output := result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l745_c7_6b48] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l749_c7_91b9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_cond;
     tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_return_output := tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l749_c7_91b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l749_c7_91b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l755_c7_a5ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;

     -- n16_MUX[uxn_opcodes_h_l745_c7_6b48] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l745_c7_6b48_cond <= VAR_n16_MUX_uxn_opcodes_h_l745_c7_6b48_cond;
     n16_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue;
     n16_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l745_c7_6b48_return_output := n16_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;

     -- t16_MUX[uxn_opcodes_h_l726_c7_d6d2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond;
     t16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue;
     t16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output := t16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_a5ec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;
     -- n16_MUX[uxn_opcodes_h_l740_c7_98fc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l740_c7_98fc_cond <= VAR_n16_MUX_uxn_opcodes_h_l740_c7_98fc_cond;
     n16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue;
     n16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output := n16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l736_c7_d28f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;

     -- t16_MUX[uxn_opcodes_h_l718_c2_b6f9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond <= VAR_t16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond;
     t16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue;
     t16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output := t16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l749_c7_91b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l745_c7_6b48] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l749_c7_91b9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_return_output := result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l740_c7_98fc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l749_c7_91b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l745_c7_6b48] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_cond;
     tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue;
     tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_return_output := tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l745_c7_6b48] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_91b9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l736_c7_d28f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l740_c7_98fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l745_c7_6b48] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l745_c7_6b48] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_cond;
     result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_return_output := result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l745_c7_6b48] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;

     -- n16_MUX[uxn_opcodes_h_l736_c7_d28f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l736_c7_d28f_cond <= VAR_n16_MUX_uxn_opcodes_h_l736_c7_d28f_cond;
     n16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue;
     n16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output := n16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l740_c7_98fc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_cond;
     tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output := tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l740_c7_98fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l730_c7_035c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_035c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_6b48_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l740_c7_98fc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_return_output := result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l736_c7_d28f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_cond;
     tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output := tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l740_c7_98fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l736_c7_d28f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l730_c7_035c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l736_c7_d28f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;

     -- n16_MUX[uxn_opcodes_h_l730_c7_035c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l730_c7_035c_cond <= VAR_n16_MUX_uxn_opcodes_h_l730_c7_035c_cond;
     n16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue;
     n16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l730_c7_035c_return_output := n16_MUX_uxn_opcodes_h_l730_c7_035c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l740_c7_98fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l726_c7_d6d2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l730_c7_035c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_035c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_98fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l736_c7_d28f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l730_c7_035c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l730_c7_035c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l730_c7_035c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_035c_cond;
     tmp16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_035c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_035c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_035c_return_output := tmp16_MUX_uxn_opcodes_h_l730_c7_035c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l730_c7_035c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l736_c7_d28f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l726_c7_d6d2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;

     -- n16_MUX[uxn_opcodes_h_l726_c7_d6d2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond <= VAR_n16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond;
     n16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue;
     n16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output := n16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l718_c2_b6f9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l736_c7_d28f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_return_output := result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_035c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_035c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_d28f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_035c_return_output;
     -- n16_MUX[uxn_opcodes_h_l718_c2_b6f9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond <= VAR_n16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond;
     n16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue;
     n16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output := n16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l730_c7_035c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l730_c7_035c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l726_c7_d6d2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_cond;
     tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output := tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l718_c2_b6f9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c7_d6d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l730_c7_035c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_return_output := result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c7_d6d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_035c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_035c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_035c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l726_c7_d6d2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output := result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l726_c7_d6d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l726_c7_d6d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l718_c2_b6f9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_cond;
     tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output := tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l718_c2_b6f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l718_c2_b6f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_d6d2_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l718_c2_b6f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l718_c2_b6f9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output := result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l718_c2_b6f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l782_l714_DUPLICATE_92c9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l782_l714_DUPLICATE_92c9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_b6f9_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l782_l714_DUPLICATE_92c9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l782_l714_DUPLICATE_92c9_return_output;
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
