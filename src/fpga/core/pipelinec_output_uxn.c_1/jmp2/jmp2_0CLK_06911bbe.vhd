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
-- Submodules: 64
entity jmp2_0CLK_06911bbe is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp2_0CLK_06911bbe;
architecture arch of jmp2_0CLK_06911bbe is
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
-- BIN_OP_EQ[uxn_opcodes_h_l601_c6_867d]
signal BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l601_c1_c352]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l601_c2_5cb1]
signal t16_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l601_c2_5cb1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l601_c2_5cb1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l601_c2_5cb1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l601_c2_5cb1]
signal result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l601_c2_5cb1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l601_c2_5cb1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l601_c2_5cb1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l601_c2_5cb1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l601_c2_5cb1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l602_c3_f014[uxn_opcodes_h_l602_c3_f014]
signal printf_uxn_opcodes_h_l602_c3_f014_uxn_opcodes_h_l602_c3_f014_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l609_c11_1536]
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l609_c7_11e0]
signal t16_MUX_uxn_opcodes_h_l609_c7_11e0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l609_c7_11e0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l609_c7_11e0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l609_c7_11e0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l609_c7_11e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l609_c7_11e0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l609_c7_11e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l609_c7_11e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l609_c7_11e0]
signal result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l613_c11_8ab7]
signal BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l613_c7_e363]
signal t16_MUX_uxn_opcodes_h_l613_c7_e363_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l613_c7_e363_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l613_c7_e363_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l613_c7_e363_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l613_c7_e363]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l613_c7_e363]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l613_c7_e363]
signal result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l613_c7_e363]
signal result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l613_c7_e363]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l613_c7_e363]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l613_c7_e363]
signal result_pc_MUX_uxn_opcodes_h_l613_c7_e363_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l613_c7_e363_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l613_c7_e363_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l613_c7_e363_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l615_c3_bf6c]
signal CONST_SL_8_uxn_opcodes_h_l615_c3_bf6c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l615_c3_bf6c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l619_c11_a9d9]
signal BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l619_c7_7bc2]
signal t16_MUX_uxn_opcodes_h_l619_c7_7bc2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l619_c7_7bc2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l619_c7_7bc2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l619_c7_7bc2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l619_c7_7bc2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l619_c7_7bc2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l619_c7_7bc2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l619_c7_7bc2]
signal result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l623_c11_080c]
signal BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l623_c7_43d7]
signal t16_MUX_uxn_opcodes_h_l623_c7_43d7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c7_43d7_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l623_c7_43d7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l623_c7_43d7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l623_c7_43d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l623_c7_43d7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l623_c7_43d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l623_c7_43d7]
signal result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l624_c3_5dbf]
signal BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l627_c32_9a99]
signal BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l627_c32_82f4]
signal BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l627_c32_123d]
signal MUX_uxn_opcodes_h_l627_c32_123d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l627_c32_123d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l627_c32_123d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l627_c32_123d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l629_c11_9a9e]
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l629_c7_af48]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l629_c7_af48]
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l629_c7_af48]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l629_c7_af48]
signal result_pc_MUX_uxn_opcodes_h_l629_c7_af48_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l629_c7_af48_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l629_c7_af48_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l629_c7_af48_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l634_c11_5eac]
signal BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l634_c7_a7d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l634_c7_a7d4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l634_c7_a7d4]
signal result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5c23( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
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
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.pc := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_stack_read := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d
BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_left,
BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_right,
BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_return_output);

-- t16_MUX_uxn_opcodes_h_l601_c2_5cb1
t16_MUX_uxn_opcodes_h_l601_c2_5cb1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l601_c2_5cb1_cond,
t16_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue,
t16_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse,
t16_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1
result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_cond,
result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue,
result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse,
result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1
result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1
result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output);

-- printf_uxn_opcodes_h_l602_c3_f014_uxn_opcodes_h_l602_c3_f014
printf_uxn_opcodes_h_l602_c3_f014_uxn_opcodes_h_l602_c3_f014 : entity work.printf_uxn_opcodes_h_l602_c3_f014_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l602_c3_f014_uxn_opcodes_h_l602_c3_f014_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536
BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_left,
BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_right,
BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_return_output);

-- t16_MUX_uxn_opcodes_h_l609_c7_11e0
t16_MUX_uxn_opcodes_h_l609_c7_11e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l609_c7_11e0_cond,
t16_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue,
t16_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse,
t16_MUX_uxn_opcodes_h_l609_c7_11e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_return_output);

-- result_pc_MUX_uxn_opcodes_h_l609_c7_11e0
result_pc_MUX_uxn_opcodes_h_l609_c7_11e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_cond,
result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue,
result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse,
result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7
BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_left,
BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_right,
BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_return_output);

-- t16_MUX_uxn_opcodes_h_l613_c7_e363
t16_MUX_uxn_opcodes_h_l613_c7_e363 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l613_c7_e363_cond,
t16_MUX_uxn_opcodes_h_l613_c7_e363_iftrue,
t16_MUX_uxn_opcodes_h_l613_c7_e363_iffalse,
t16_MUX_uxn_opcodes_h_l613_c7_e363_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363
result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363
result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_return_output);

-- result_pc_MUX_uxn_opcodes_h_l613_c7_e363
result_pc_MUX_uxn_opcodes_h_l613_c7_e363 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l613_c7_e363_cond,
result_pc_MUX_uxn_opcodes_h_l613_c7_e363_iftrue,
result_pc_MUX_uxn_opcodes_h_l613_c7_e363_iffalse,
result_pc_MUX_uxn_opcodes_h_l613_c7_e363_return_output);

-- CONST_SL_8_uxn_opcodes_h_l615_c3_bf6c
CONST_SL_8_uxn_opcodes_h_l615_c3_bf6c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l615_c3_bf6c_x,
CONST_SL_8_uxn_opcodes_h_l615_c3_bf6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9
BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_left,
BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_right,
BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_return_output);

-- t16_MUX_uxn_opcodes_h_l619_c7_7bc2
t16_MUX_uxn_opcodes_h_l619_c7_7bc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l619_c7_7bc2_cond,
t16_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue,
t16_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse,
t16_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2
result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2
result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2
result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2
result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2
result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2
result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_cond,
result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue,
result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse,
result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c
BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_left,
BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_right,
BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_return_output);

-- t16_MUX_uxn_opcodes_h_l623_c7_43d7
t16_MUX_uxn_opcodes_h_l623_c7_43d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l623_c7_43d7_cond,
t16_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue,
t16_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse,
t16_MUX_uxn_opcodes_h_l623_c7_43d7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7
result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7
result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_return_output);

-- result_pc_MUX_uxn_opcodes_h_l623_c7_43d7
result_pc_MUX_uxn_opcodes_h_l623_c7_43d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_cond,
result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue,
result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse,
result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf
BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_left,
BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_right,
BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99
BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_left,
BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_right,
BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4
BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_left,
BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_right,
BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_return_output);

-- MUX_uxn_opcodes_h_l627_c32_123d
MUX_uxn_opcodes_h_l627_c32_123d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l627_c32_123d_cond,
MUX_uxn_opcodes_h_l627_c32_123d_iftrue,
MUX_uxn_opcodes_h_l627_c32_123d_iffalse,
MUX_uxn_opcodes_h_l627_c32_123d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e
BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_left,
BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_right,
BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_return_output);

-- result_pc_MUX_uxn_opcodes_h_l629_c7_af48
result_pc_MUX_uxn_opcodes_h_l629_c7_af48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l629_c7_af48_cond,
result_pc_MUX_uxn_opcodes_h_l629_c7_af48_iftrue,
result_pc_MUX_uxn_opcodes_h_l629_c7_af48_iffalse,
result_pc_MUX_uxn_opcodes_h_l629_c7_af48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac
BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_left,
BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_right,
BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4
result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4
result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_cond,
result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue,
result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse,
result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_return_output,
 t16_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
 result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_return_output,
 t16_MUX_uxn_opcodes_h_l609_c7_11e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_return_output,
 result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_return_output,
 t16_MUX_uxn_opcodes_h_l613_c7_e363_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_return_output,
 result_pc_MUX_uxn_opcodes_h_l613_c7_e363_return_output,
 CONST_SL_8_uxn_opcodes_h_l615_c3_bf6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_return_output,
 t16_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output,
 result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_return_output,
 t16_MUX_uxn_opcodes_h_l623_c7_43d7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_return_output,
 result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_return_output,
 BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_return_output,
 BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_return_output,
 MUX_uxn_opcodes_h_l627_c32_123d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_return_output,
 result_pc_MUX_uxn_opcodes_h_l629_c7_af48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output,
 result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l609_c7_11e0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_679a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l602_c3_f014_uxn_opcodes_h_l602_c3_f014_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l613_c7_e363_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l609_c7_11e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l611_c3_7ac2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_e363_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l613_c7_e363_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l613_c7_e363_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l613_c7_e363_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l617_c3_5c76 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_e363_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_e363_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_e363_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_bf6c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_bf6c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c7_43d7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l619_c7_7bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l621_c3_7e12 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l619_c7_7bc2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c7_43d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l623_c7_43d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_af48_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l627_c32_123d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l627_c32_123d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l627_c32_123d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l627_c32_123d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_af48_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_af48_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_af48_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l636_c3_48c8 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_0228_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_b4b7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_a92e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_6df6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_7315_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l624_l614_DUPLICATE_8bbf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5c23_uxn_opcodes_h_l640_l597_DUPLICATE_9bc7_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l621_c3_7e12 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l621_c3_7e12;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l617_c3_5c76 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l617_c3_5c76;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l627_c32_123d_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l627_c32_123d_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_679a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_679a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l611_c3_7ac2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l611_c3_7ac2;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue := to_unsigned(0, 1);
     VAR_result_pc_uxn_opcodes_h_l636_c3_48c8 := resize(to_unsigned(0, 1), 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue := VAR_result_pc_uxn_opcodes_h_l636_c3_48c8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_left := t16;
     VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_af48_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l634_c11_5eac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_left;
     BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_return_output := BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l627_c32_9a99] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_left;
     BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_return_output := BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l601_c2_5cb1] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l601_c2_5cb1_return_output := result.is_stack_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l619_c7_7bc2] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l619_c7_7bc2_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_b4b7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_b4b7_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l601_c6_867d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_left;
     BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_return_output := BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l623_c7_43d7] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l623_c7_43d7_return_output := result.is_stack_read;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l601_c2_5cb1] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l601_c2_5cb1_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_7315 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_7315_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l613_c11_8ab7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_left;
     BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_return_output := BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l623_c11_080c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_left;
     BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_return_output := BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l619_c11_a9d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l629_c11_9a9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l609_c11_1536] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_left;
     BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_return_output := BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_0228 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_0228_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_a92e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_a92e_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l624_l614_DUPLICATE_8bbf LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l624_l614_DUPLICATE_8bbf_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_6df6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_6df6_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_left := VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_9a99_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l601_c2_5cb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_867d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l609_c7_11e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_1536_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_e363_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l613_c7_e363_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_8ab7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l619_c7_7bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_a9d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l623_c7_43d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_080c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_af48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_9a9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_5eac_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l624_l614_DUPLICATE_8bbf_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_bf6c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l624_l614_DUPLICATE_8bbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_0228_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_0228_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_0228_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_0228_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_0228_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_b4b7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_b4b7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_e363_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_b4b7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_b4b7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_b4b7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_b4b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_7315_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_7315_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_7315_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_7315_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_7315_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_7315_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_6df6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_6df6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_6df6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_6df6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_6df6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_6df6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_a92e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_a92e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_a92e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_a92e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_a92e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l601_c2_5cb1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l623_c7_43d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l601_c2_5cb1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l619_c7_7bc2_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l634_c7_a7d4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l623_c7_43d7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l601_c1_c352] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l601_c2_5cb1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l629_c7_af48] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l634_c7_a7d4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_cond;
     result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output := result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l634_c7_a7d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l624_c3_5dbf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_left;
     BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_return_output := BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l619_c7_7bc2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l615_c3_bf6c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l615_c3_bf6c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_bf6c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_bf6c_return_output := CONST_SL_8_uxn_opcodes_h_l615_c3_bf6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l601_c2_5cb1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l627_c32_82f4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_left;
     BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_return_output := BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l627_c32_123d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_82f4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_5dbf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l613_c7_e363_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_bf6c_return_output;
     VAR_printf_uxn_opcodes_h_l602_c3_f014_uxn_opcodes_h_l602_c3_f014_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_c352_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_af48_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_43d7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_af48_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_a7d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l629_c7_af48] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l629_c7_af48_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_af48_cond;
     result_pc_MUX_uxn_opcodes_h_l629_c7_af48_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_af48_iftrue;
     result_pc_MUX_uxn_opcodes_h_l629_c7_af48_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_af48_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_af48_return_output := result_pc_MUX_uxn_opcodes_h_l629_c7_af48_return_output;

     -- printf_uxn_opcodes_h_l602_c3_f014[uxn_opcodes_h_l602_c3_f014] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l602_c3_f014_uxn_opcodes_h_l602_c3_f014_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l602_c3_f014_uxn_opcodes_h_l602_c3_f014_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l629_c7_af48] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l613_c7_e363] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l619_c7_7bc2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l623_c7_43d7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_return_output;

     -- t16_MUX[uxn_opcodes_h_l623_c7_43d7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l623_c7_43d7_cond <= VAR_t16_MUX_uxn_opcodes_h_l623_c7_43d7_cond;
     t16_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue;
     t16_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l623_c7_43d7_return_output := t16_MUX_uxn_opcodes_h_l623_c7_43d7_return_output;

     -- MUX[uxn_opcodes_h_l627_c32_123d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l627_c32_123d_cond <= VAR_MUX_uxn_opcodes_h_l627_c32_123d_cond;
     MUX_uxn_opcodes_h_l627_c32_123d_iftrue <= VAR_MUX_uxn_opcodes_h_l627_c32_123d_iftrue;
     MUX_uxn_opcodes_h_l627_c32_123d_iffalse <= VAR_MUX_uxn_opcodes_h_l627_c32_123d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l627_c32_123d_return_output := MUX_uxn_opcodes_h_l627_c32_123d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l629_c7_af48] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue := VAR_MUX_uxn_opcodes_h_l627_c32_123d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_af48_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_af48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_43d7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_af48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_e363_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l623_c7_43d7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l623_c7_43d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_return_output;

     -- t16_MUX[uxn_opcodes_h_l619_c7_7bc2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l619_c7_7bc2_cond <= VAR_t16_MUX_uxn_opcodes_h_l619_c7_7bc2_cond;
     t16_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue;
     t16_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output := t16_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l623_c7_43d7] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_cond;
     result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue;
     result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_return_output := result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l609_c7_11e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l623_c7_43d7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l613_c7_e363] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l623_c7_43d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l619_c7_7bc2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_43d7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_43d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_e363_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_43d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_43d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_11e0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l613_c7_e363_iffalse := VAR_t16_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l619_c7_7bc2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_cond;
     result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output := result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output;

     -- t16_MUX[uxn_opcodes_h_l613_c7_e363] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l613_c7_e363_cond <= VAR_t16_MUX_uxn_opcodes_h_l613_c7_e363_cond;
     t16_MUX_uxn_opcodes_h_l613_c7_e363_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l613_c7_e363_iftrue;
     t16_MUX_uxn_opcodes_h_l613_c7_e363_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l613_c7_e363_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l613_c7_e363_return_output := t16_MUX_uxn_opcodes_h_l613_c7_e363_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l609_c7_11e0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l619_c7_7bc2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l619_c7_7bc2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l601_c2_5cb1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l613_c7_e363] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l619_c7_7bc2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_e363_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_11e0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_e363_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_7bc2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l613_c7_e363_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l613_c7_e363] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l613_c7_e363] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l613_c7_e363_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_e363_cond;
     result_pc_MUX_uxn_opcodes_h_l613_c7_e363_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_e363_iftrue;
     result_pc_MUX_uxn_opcodes_h_l613_c7_e363_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_e363_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_e363_return_output := result_pc_MUX_uxn_opcodes_h_l613_c7_e363_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l609_c7_11e0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l613_c7_e363] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l613_c7_e363] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_return_output;

     -- t16_MUX[uxn_opcodes_h_l609_c7_11e0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l609_c7_11e0_cond <= VAR_t16_MUX_uxn_opcodes_h_l609_c7_11e0_cond;
     t16_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue;
     t16_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l609_c7_11e0_return_output := t16_MUX_uxn_opcodes_h_l609_c7_11e0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l601_c2_5cb1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_e363_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_e363_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_11e0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_e363_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_e363_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l609_c7_11e0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l601_c2_5cb1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l609_c7_11e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_return_output;

     -- t16_MUX[uxn_opcodes_h_l601_c2_5cb1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l601_c2_5cb1_cond <= VAR_t16_MUX_uxn_opcodes_h_l601_c2_5cb1_cond;
     t16_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue;
     t16_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output := t16_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l609_c7_11e0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l609_c7_11e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l609_c7_11e0] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_cond;
     result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_iftrue;
     result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_return_output := result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_11e0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_11e0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_11e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_11e0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l601_c2_5cb1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l601_c2_5cb1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l601_c2_5cb1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l601_c2_5cb1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_cond;
     result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output := result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5c23_uxn_opcodes_h_l640_l597_DUPLICATE_9bc7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5c23_uxn_opcodes_h_l640_l597_DUPLICATE_9bc7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5c23(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_5cb1_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5c23_uxn_opcodes_h_l640_l597_DUPLICATE_9bc7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5c23_uxn_opcodes_h_l640_l597_DUPLICATE_9bc7_return_output;
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
