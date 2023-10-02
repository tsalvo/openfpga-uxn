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
-- Submodules: 108
entity lth2_0CLK_5fcb251d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_5fcb251d;
architecture arch of lth2_0CLK_5fcb251d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1204_c6_16e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1204_c1_7ee6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1204_c2_b95c]
signal t16_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1204_c2_b95c]
signal n16_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1204_c2_b95c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1204_c2_b95c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1204_c2_b95c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1204_c2_b95c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1204_c2_b95c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1204_c2_b95c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1204_c2_b95c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1204_c2_b95c]
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1205_c3_9f73[uxn_opcodes_h_l1205_c3_9f73]
signal printf_uxn_opcodes_h_l1205_c3_9f73_uxn_opcodes_h_l1205_c3_9f73_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1212_c11_867d]
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1212_c7_7ecb]
signal t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1212_c7_7ecb]
signal n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1212_c7_7ecb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1212_c7_7ecb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1212_c7_7ecb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1212_c7_7ecb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1212_c7_7ecb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1212_c7_7ecb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1212_c7_7ecb]
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1216_c11_5e6a]
signal BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1216_c7_780e]
signal t16_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1216_c7_780e]
signal n16_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1216_c7_780e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1216_c7_780e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1216_c7_780e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1216_c7_780e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1216_c7_780e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1216_c7_780e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1216_c7_780e]
signal result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_844d]
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1222_c7_31a6]
signal t16_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1222_c7_31a6]
signal n16_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1222_c7_31a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_31a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_31a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1222_c7_31a6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_31a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_31a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1222_c7_31a6]
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_2449]
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1226_c7_ef87]
signal t16_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1226_c7_ef87]
signal n16_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1226_c7_ef87]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_ef87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_ef87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1226_c7_ef87]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_ef87]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_ef87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1226_c7_ef87]
signal result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1227_c3_a352]
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1231_c11_36e5]
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1231_c7_2f82]
signal n16_MUX_uxn_opcodes_h_l1231_c7_2f82_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1231_c7_2f82]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1231_c7_2f82]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1231_c7_2f82]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1231_c7_2f82]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1231_c7_2f82]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1231_c7_2f82]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1231_c7_2f82]
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1235_c11_cf0a]
signal BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1235_c7_378f]
signal n16_MUX_uxn_opcodes_h_l1235_c7_378f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1235_c7_378f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1235_c7_378f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1235_c7_378f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1235_c7_378f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1235_c7_378f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1235_c7_378f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1235_c7_378f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1235_c7_378f]
signal result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_b33d]
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1241_c7_dad8]
signal n16_MUX_uxn_opcodes_h_l1241_c7_dad8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_dad8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_dad8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_dad8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1241_c7_dad8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_dad8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_dad8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1241_c7_dad8]
signal result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1245_c11_f236]
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1245_c7_50c7]
signal n16_MUX_uxn_opcodes_h_l1245_c7_50c7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1245_c7_50c7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1245_c7_50c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1245_c7_50c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1245_c7_50c7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1245_c7_50c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1245_c7_50c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1245_c7_50c7]
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1246_c3_9cc1]
signal BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1249_c32_95c2]
signal BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1249_c32_91db]
signal BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1249_c32_1633]
signal MUX_uxn_opcodes_h_l1249_c32_1633_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1249_c32_1633_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1249_c32_1633_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1249_c32_1633_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1251_c11_1959]
signal BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1251_c7_5368]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1251_c7_5368]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1251_c7_5368]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1251_c7_5368]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1251_c7_5368]
signal result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_return_output : unsigned(7 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1255_c24_02d9]
signal BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1255_c24_253f]
signal MUX_uxn_opcodes_h_l1255_c24_253f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1255_c24_253f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1255_c24_253f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1255_c24_253f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1257_c11_ae14]
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1257_c7_a64a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1257_c7_a64a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
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
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;
      base.stack_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4
BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_return_output);

-- t16_MUX_uxn_opcodes_h_l1204_c2_b95c
t16_MUX_uxn_opcodes_h_l1204_c2_b95c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1204_c2_b95c_cond,
t16_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue,
t16_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse,
t16_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output);

-- n16_MUX_uxn_opcodes_h_l1204_c2_b95c
n16_MUX_uxn_opcodes_h_l1204_c2_b95c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1204_c2_b95c_cond,
n16_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue,
n16_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse,
n16_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c
result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output);

-- printf_uxn_opcodes_h_l1205_c3_9f73_uxn_opcodes_h_l1205_c3_9f73
printf_uxn_opcodes_h_l1205_c3_9f73_uxn_opcodes_h_l1205_c3_9f73 : entity work.printf_uxn_opcodes_h_l1205_c3_9f73_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1205_c3_9f73_uxn_opcodes_h_l1205_c3_9f73_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_left,
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_right,
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_return_output);

-- t16_MUX_uxn_opcodes_h_l1212_c7_7ecb
t16_MUX_uxn_opcodes_h_l1212_c7_7ecb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond,
t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue,
t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse,
t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output);

-- n16_MUX_uxn_opcodes_h_l1212_c7_7ecb
n16_MUX_uxn_opcodes_h_l1212_c7_7ecb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond,
n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue,
n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse,
n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_left,
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_right,
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_return_output);

-- t16_MUX_uxn_opcodes_h_l1216_c7_780e
t16_MUX_uxn_opcodes_h_l1216_c7_780e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1216_c7_780e_cond,
t16_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue,
t16_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse,
t16_MUX_uxn_opcodes_h_l1216_c7_780e_return_output);

-- n16_MUX_uxn_opcodes_h_l1216_c7_780e
n16_MUX_uxn_opcodes_h_l1216_c7_780e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1216_c7_780e_cond,
n16_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue,
n16_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse,
n16_MUX_uxn_opcodes_h_l1216_c7_780e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e
result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e
result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e
result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_left,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_right,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_return_output);

-- t16_MUX_uxn_opcodes_h_l1222_c7_31a6
t16_MUX_uxn_opcodes_h_l1222_c7_31a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1222_c7_31a6_cond,
t16_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue,
t16_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse,
t16_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output);

-- n16_MUX_uxn_opcodes_h_l1222_c7_31a6
n16_MUX_uxn_opcodes_h_l1222_c7_31a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1222_c7_31a6_cond,
n16_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue,
n16_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse,
n16_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6
result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_left,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_right,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_return_output);

-- t16_MUX_uxn_opcodes_h_l1226_c7_ef87
t16_MUX_uxn_opcodes_h_l1226_c7_ef87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1226_c7_ef87_cond,
t16_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue,
t16_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse,
t16_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output);

-- n16_MUX_uxn_opcodes_h_l1226_c7_ef87
n16_MUX_uxn_opcodes_h_l1226_c7_ef87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1226_c7_ef87_cond,
n16_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue,
n16_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse,
n16_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87
result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87
result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87
result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_cond,
result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352
BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_left,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_right,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_left,
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_right,
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_return_output);

-- n16_MUX_uxn_opcodes_h_l1231_c7_2f82
n16_MUX_uxn_opcodes_h_l1231_c7_2f82 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1231_c7_2f82_cond,
n16_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue,
n16_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse,
n16_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82
result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_cond,
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_left,
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_right,
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_return_output);

-- n16_MUX_uxn_opcodes_h_l1235_c7_378f
n16_MUX_uxn_opcodes_h_l1235_c7_378f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1235_c7_378f_cond,
n16_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue,
n16_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse,
n16_MUX_uxn_opcodes_h_l1235_c7_378f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f
result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f
result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f
result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_left,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_right,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_return_output);

-- n16_MUX_uxn_opcodes_h_l1241_c7_dad8
n16_MUX_uxn_opcodes_h_l1241_c7_dad8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1241_c7_dad8_cond,
n16_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue,
n16_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse,
n16_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_left,
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_right,
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_return_output);

-- n16_MUX_uxn_opcodes_h_l1245_c7_50c7
n16_MUX_uxn_opcodes_h_l1245_c7_50c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1245_c7_50c7_cond,
n16_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue,
n16_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse,
n16_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1
BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_left,
BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_right,
BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2
BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_left,
BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_right,
BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db
BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_left,
BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_right,
BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_return_output);

-- MUX_uxn_opcodes_h_l1249_c32_1633
MUX_uxn_opcodes_h_l1249_c32_1633 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1249_c32_1633_cond,
MUX_uxn_opcodes_h_l1249_c32_1633_iftrue,
MUX_uxn_opcodes_h_l1249_c32_1633_iffalse,
MUX_uxn_opcodes_h_l1249_c32_1633_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959
BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_left,
BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_right,
BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_cond,
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9
BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_left,
BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_right,
BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_return_output);

-- MUX_uxn_opcodes_h_l1255_c24_253f
MUX_uxn_opcodes_h_l1255_c24_253f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1255_c24_253f_cond,
MUX_uxn_opcodes_h_l1255_c24_253f_iftrue,
MUX_uxn_opcodes_h_l1255_c24_253f_iffalse,
MUX_uxn_opcodes_h_l1255_c24_253f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_left,
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_right,
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6
CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_return_output,
 t16_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output,
 n16_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_return_output,
 t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output,
 n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_return_output,
 t16_MUX_uxn_opcodes_h_l1216_c7_780e_return_output,
 n16_MUX_uxn_opcodes_h_l1216_c7_780e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_return_output,
 t16_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output,
 n16_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_return_output,
 t16_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output,
 n16_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_return_output,
 n16_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_return_output,
 n16_MUX_uxn_opcodes_h_l1235_c7_378f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_return_output,
 n16_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_return_output,
 n16_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_return_output,
 MUX_uxn_opcodes_h_l1249_c32_1633_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_return_output,
 MUX_uxn_opcodes_h_l1255_c24_253f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_0c86 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1205_c3_9f73_uxn_opcodes_h_l1205_c3_9f73_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1214_c3_a1e6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_d801 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1224_c3_bf90 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1229_c3_7cfc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_378f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1231_c7_2f82_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_ad54 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_378f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_35ad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_dad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_ee20 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_50c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1245_c7_50c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1249_c32_1633_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1249_c32_1633_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1249_c32_1633_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1249_c32_1633_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1254_c3_b913 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1255_c24_253f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1255_c24_253f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1255_c24_253f_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1255_c24_253f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_625b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_6e2f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_024a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_36ce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_ee82_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1236_l1217_l1246_DUPLICATE_4cf9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1251_l1245_DUPLICATE_3bdc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1262_l1200_DUPLICATE_1d77_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1224_c3_bf90 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1224_c3_bf90;
     VAR_MUX_uxn_opcodes_h_l1249_c32_1633_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_ee20 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_ee20;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_35ad := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_35ad;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1255_c24_253f_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l1249_c32_1633_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1254_c3_b913 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1254_c3_b913;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_ad54 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_ad54;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1255_c24_253f_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1229_c3_7cfc := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1229_c3_7cfc;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_0c86 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_0c86;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_d801 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_d801;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_right := to_unsigned(8, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_right := to_unsigned(9, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1214_c3_a1e6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1214_c3_a1e6;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse := t16;
     -- BIN_OP_LT[uxn_opcodes_h_l1255_c24_02d9] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_left;
     BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_return_output := BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1231_c11_36e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1245_c11_f236] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_left;
     BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_return_output := BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_625b LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_625b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_2449] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_left;
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_return_output := BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1204_c6_16e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_36ce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_36ce_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1257_c11_ae14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_left;
     BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_return_output := BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1251_c11_1959] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_left;
     BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_return_output := BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_844d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1235_c11_cf0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1245_c7_50c7] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1245_c7_50c7_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_024a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_024a_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1251_l1245_DUPLICATE_3bdc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1251_l1245_DUPLICATE_3bdc_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_ee82 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_ee82_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1212_c11_867d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1204_c2_b95c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1204_c2_b95c_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_b33d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1216_c11_5e6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_6e2f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_6e2f_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1249_c32_95c2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_left;
     BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_return_output := BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1236_l1217_l1246_DUPLICATE_4cf9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1236_l1217_l1246_DUPLICATE_4cf9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_95c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1204_c2_b95c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1204_c2_b95c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_16e4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_867d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1216_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1216_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5e6a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_31a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1222_c7_31a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_844d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ef87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1226_c7_ef87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2449_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1231_c7_2f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_36e5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_378f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_cf0a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_dad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b33d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_50c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_f236_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_1959_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_ae14_return_output;
     VAR_MUX_uxn_opcodes_h_l1255_c24_253f_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_02d9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1236_l1217_l1246_DUPLICATE_4cf9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1236_l1217_l1246_DUPLICATE_4cf9_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1236_l1217_l1246_DUPLICATE_4cf9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_625b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_625b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_625b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_625b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_625b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_625b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_625b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_625b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_625b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_ee82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_ee82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_ee82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_ee82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_ee82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_ee82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_ee82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_ee82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_ee82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_ee82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_6e2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_6e2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_6e2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_6e2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_6e2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_6e2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_6e2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_6e2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_6e2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_36ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_36ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_36ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_36ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_36ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_36ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_36ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_36ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_36ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1251_l1245_DUPLICATE_3bdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1251_l1245_DUPLICATE_3bdc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_024a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_024a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_024a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_024a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_024a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_024a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_024a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_024a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_024a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_024a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1204_c2_b95c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1245_c7_50c7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1257_c7_a64a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1249_c32_91db] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_left;
     BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_return_output := BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1257_c7_a64a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_return_output;

     -- MUX[uxn_opcodes_h_l1255_c24_253f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1255_c24_253f_cond <= VAR_MUX_uxn_opcodes_h_l1255_c24_253f_cond;
     MUX_uxn_opcodes_h_l1255_c24_253f_iftrue <= VAR_MUX_uxn_opcodes_h_l1255_c24_253f_iftrue;
     MUX_uxn_opcodes_h_l1255_c24_253f_iffalse <= VAR_MUX_uxn_opcodes_h_l1255_c24_253f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1255_c24_253f_return_output := MUX_uxn_opcodes_h_l1255_c24_253f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1204_c2_b95c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1245_c7_50c7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1227_c3_a352] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_left;
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_return_output := BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1204_c1_7ee6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1251_c7_5368] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1251_c7_5368] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1246_c3_9cc1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_left;
     BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_return_output := BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1249_c32_1633_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_91db_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a352_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_9cc1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_74a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue := VAR_MUX_uxn_opcodes_h_l1255_c24_253f_return_output;
     VAR_printf_uxn_opcodes_h_l1205_c3_9f73_uxn_opcodes_h_l1205_c3_9f73_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_7ee6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a64a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_5368_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a64a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_5368_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1245_c7_50c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output;

     -- MUX[uxn_opcodes_h_l1249_c32_1633] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1249_c32_1633_cond <= VAR_MUX_uxn_opcodes_h_l1249_c32_1633_cond;
     MUX_uxn_opcodes_h_l1249_c32_1633_iftrue <= VAR_MUX_uxn_opcodes_h_l1249_c32_1633_iftrue;
     MUX_uxn_opcodes_h_l1249_c32_1633_iffalse <= VAR_MUX_uxn_opcodes_h_l1249_c32_1633_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1249_c32_1633_return_output := MUX_uxn_opcodes_h_l1249_c32_1633_return_output;

     -- printf_uxn_opcodes_h_l1205_c3_9f73[uxn_opcodes_h_l1205_c3_9f73] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1205_c3_9f73_uxn_opcodes_h_l1205_c3_9f73_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1205_c3_9f73_uxn_opcodes_h_l1205_c3_9f73_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1245_c7_50c7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1226_c7_ef87] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1226_c7_ef87_cond <= VAR_t16_MUX_uxn_opcodes_h_l1226_c7_ef87_cond;
     t16_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue;
     t16_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output := t16_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1251_c7_5368] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_return_output := result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1251_c7_5368] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1251_c7_5368] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_return_output;

     -- n16_MUX[uxn_opcodes_h_l1245_c7_50c7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1245_c7_50c7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_50c7_cond;
     n16_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue;
     n16_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output := n16_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1241_c7_dad8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue := VAR_MUX_uxn_opcodes_h_l1249_c32_1633_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_5368_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_5368_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_5368_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1235_c7_378f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1241_c7_dad8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1241_c7_dad8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_dad8_cond;
     n16_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue;
     n16_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output := n16_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1245_c7_50c7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1245_c7_50c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1245_c7_50c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_dad8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_dad8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1222_c7_31a6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1222_c7_31a6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1222_c7_31a6_cond;
     t16_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue;
     t16_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output := t16_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1245_c7_50c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_378f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_50c7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_dad8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1241_c7_dad8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1235_c7_378f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1235_c7_378f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_dad8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1216_c7_780e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1216_c7_780e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1216_c7_780e_cond;
     t16_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue;
     t16_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1216_c7_780e_return_output := t16_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1235_c7_378f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1235_c7_378f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1235_c7_378f_cond;
     n16_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue;
     n16_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_378f_return_output := n16_MUX_uxn_opcodes_h_l1235_c7_378f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_dad8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1231_c7_2f82] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1235_c7_378f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_378f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_378f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_dad8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1231_c7_2f82] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1235_c7_378f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1235_c7_378f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1235_c7_378f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1226_c7_ef87] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1231_c7_2f82] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1235_c7_378f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1231_c7_2f82] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1231_c7_2f82_cond <= VAR_n16_MUX_uxn_opcodes_h_l1231_c7_2f82_cond;
     n16_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue;
     n16_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output := n16_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output;

     -- t16_MUX[uxn_opcodes_h_l1212_c7_7ecb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond;
     t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue;
     t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output := t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_378f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_378f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_378f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_378f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1231_c7_2f82] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1226_c7_ef87] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;

     -- n16_MUX[uxn_opcodes_h_l1226_c7_ef87] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1226_c7_ef87_cond <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ef87_cond;
     n16_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue;
     n16_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output := n16_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;

     -- t16_MUX[uxn_opcodes_h_l1204_c2_b95c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1204_c2_b95c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1204_c2_b95c_cond;
     t16_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue;
     t16_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output := t16_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1222_c7_31a6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_ef87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1231_c7_2f82] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1231_c7_2f82] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output := result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1231_c7_2f82] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_2f82_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_ef87] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_ef87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_ef87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_31a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1222_c7_31a6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1222_c7_31a6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_31a6_cond;
     n16_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue;
     n16_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output := n16_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1226_c7_ef87] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output := result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1222_c7_31a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1216_c7_780e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_ef87_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1212_c7_7ecb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_31a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_31a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1216_c7_780e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_31a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1216_c7_780e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1216_c7_780e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1216_c7_780e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1216_c7_780e_cond;
     n16_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue;
     n16_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1216_c7_780e_return_output := n16_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1222_c7_31a6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_31a6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1212_c7_7ecb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1216_c7_780e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1216_c7_780e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1216_c7_780e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1216_c7_780e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1212_c7_7ecb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond;
     n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue;
     n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output := n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1212_c7_7ecb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1204_c2_b95c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_780e_return_output;
     -- n16_MUX[uxn_opcodes_h_l1204_c2_b95c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1204_c2_b95c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1204_c2_b95c_cond;
     n16_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue;
     n16_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output := n16_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1204_c2_b95c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1204_c2_b95c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1212_c7_7ecb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1212_c7_7ecb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1212_c7_7ecb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1212_c7_7ecb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_7ecb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1204_c2_b95c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1204_c2_b95c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1204_c2_b95c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1204_c2_b95c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1262_l1200_DUPLICATE_1d77 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1262_l1200_DUPLICATE_1d77_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_b95c_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1262_l1200_DUPLICATE_1d77_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1262_l1200_DUPLICATE_1d77_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
