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
-- Submodules: 101
entity lda2_0CLK_e5fcbde3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_e5fcbde3;
architecture arch of lda2_0CLK_e5fcbde3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1899_c6_d86f]
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1899_c2_bb0a]
signal tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1899_c2_bb0a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1899_c2_bb0a]
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1899_c2_bb0a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1899_c2_bb0a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1899_c2_bb0a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1899_c2_bb0a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1899_c2_bb0a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1899_c2_bb0a]
signal t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1904_c11_2ad0]
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1904_c7_43f8]
signal tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1904_c7_43f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1904_c7_43f8]
signal result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1904_c7_43f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1904_c7_43f8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1904_c7_43f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1904_c7_43f8]
signal result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1904_c7_43f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1904_c7_43f8]
signal t16_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1907_c11_b277]
signal BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1907_c7_239a]
signal tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1907_c7_239a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1907_c7_239a]
signal result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1907_c7_239a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1907_c7_239a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1907_c7_239a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1907_c7_239a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1907_c7_239a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1907_c7_239a]
signal t16_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1909_c3_7eea]
signal CONST_SL_8_uxn_opcodes_h_l1909_c3_7eea_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1909_c3_7eea_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1912_c11_bb4b]
signal BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1912_c7_459a]
signal tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1912_c7_459a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1912_c7_459a]
signal result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1912_c7_459a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1912_c7_459a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1912_c7_459a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1912_c7_459a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1912_c7_459a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1912_c7_459a]
signal t16_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1915_c11_14ab]
signal BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1915_c7_96cb]
signal tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1915_c7_96cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1915_c7_96cb]
signal result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1915_c7_96cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1915_c7_96cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1915_c7_96cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1915_c7_96cb]
signal result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1915_c7_96cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1915_c7_96cb]
signal t16_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1916_c3_74ba]
signal BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1918_c32_af9b]
signal BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1918_c32_d812]
signal BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1918_c32_cf8f]
signal MUX_uxn_opcodes_h_l1918_c32_cf8f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1918_c32_cf8f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1918_c32_cf8f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1918_c32_cf8f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1921_c11_ba60]
signal BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1921_c7_ecdb]
signal tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1921_c7_ecdb]
signal result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1921_c7_ecdb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1921_c7_ecdb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1921_c7_ecdb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1921_c7_ecdb]
signal result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1921_c7_ecdb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1925_c11_0bb8]
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1925_c7_d111]
signal tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1925_c7_d111]
signal result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1925_c7_d111]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1925_c7_d111]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1925_c7_d111]
signal result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1925_c7_d111]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1927_c3_2430]
signal CONST_SL_8_uxn_opcodes_h_l1927_c3_2430_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1927_c3_2430_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1928_c21_c2b3]
signal BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1930_c11_08c5]
signal BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1930_c7_dafd]
signal tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1930_c7_dafd]
signal result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1930_c7_dafd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1930_c7_dafd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1930_c7_dafd]
signal result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1930_c7_dafd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1931_c21_9f7d]
signal BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1933_c11_5413]
signal BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1933_c7_9bd3]
signal tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1933_c7_9bd3]
signal result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1933_c7_9bd3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1933_c7_9bd3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1933_c7_9bd3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1934_c3_af84]
signal BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1939_c11_1e0f]
signal BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1939_c7_445b]
signal result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1939_c7_445b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1939_c7_445b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1939_c7_445b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1941_c34_1877]
signal CONST_SR_8_uxn_opcodes_h_l1941_c34_1877_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1941_c34_1877_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1943_c11_44e0]
signal BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1943_c7_017a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1943_c7_017a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a287( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f
BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_left,
BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_right,
BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a
tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond,
tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a
result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a
result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output);

-- t16_MUX_uxn_opcodes_h_l1899_c2_bb0a
t16_MUX_uxn_opcodes_h_l1899_c2_bb0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond,
t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue,
t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse,
t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_left,
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_right,
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8
tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_cond,
tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8
result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8
result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output);

-- t16_MUX_uxn_opcodes_h_l1904_c7_43f8
t16_MUX_uxn_opcodes_h_l1904_c7_43f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1904_c7_43f8_cond,
t16_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue,
t16_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse,
t16_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277
BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_left,
BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_right,
BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1907_c7_239a
tmp16_MUX_uxn_opcodes_h_l1907_c7_239a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_cond,
tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a
result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a
result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a
result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a
result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a
result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_return_output);

-- t16_MUX_uxn_opcodes_h_l1907_c7_239a
t16_MUX_uxn_opcodes_h_l1907_c7_239a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1907_c7_239a_cond,
t16_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue,
t16_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse,
t16_MUX_uxn_opcodes_h_l1907_c7_239a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1909_c3_7eea
CONST_SL_8_uxn_opcodes_h_l1909_c3_7eea : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1909_c3_7eea_x,
CONST_SL_8_uxn_opcodes_h_l1909_c3_7eea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b
BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_left,
BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_right,
BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1912_c7_459a
tmp16_MUX_uxn_opcodes_h_l1912_c7_459a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_cond,
tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a
result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a
result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a
result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a
result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a
result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_return_output);

-- t16_MUX_uxn_opcodes_h_l1912_c7_459a
t16_MUX_uxn_opcodes_h_l1912_c7_459a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1912_c7_459a_cond,
t16_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue,
t16_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse,
t16_MUX_uxn_opcodes_h_l1912_c7_459a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab
BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_left,
BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_right,
BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb
tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_cond,
tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb
result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb
result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb
result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output);

-- t16_MUX_uxn_opcodes_h_l1915_c7_96cb
t16_MUX_uxn_opcodes_h_l1915_c7_96cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1915_c7_96cb_cond,
t16_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue,
t16_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse,
t16_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba
BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_left,
BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_right,
BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b
BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_left,
BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_right,
BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812
BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_left,
BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_right,
BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_return_output);

-- MUX_uxn_opcodes_h_l1918_c32_cf8f
MUX_uxn_opcodes_h_l1918_c32_cf8f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1918_c32_cf8f_cond,
MUX_uxn_opcodes_h_l1918_c32_cf8f_iftrue,
MUX_uxn_opcodes_h_l1918_c32_cf8f_iffalse,
MUX_uxn_opcodes_h_l1918_c32_cf8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60
BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_left,
BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_right,
BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb
tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond,
tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb
result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb
result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb
result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8
BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_left,
BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_right,
BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1925_c7_d111
tmp16_MUX_uxn_opcodes_h_l1925_c7_d111 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_cond,
tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue,
tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse,
tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111
result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_cond,
result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111
result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1927_c3_2430
CONST_SL_8_uxn_opcodes_h_l1927_c3_2430 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1927_c3_2430_x,
CONST_SL_8_uxn_opcodes_h_l1927_c3_2430_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3
BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_left,
BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_right,
BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_left,
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_right,
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd
tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_cond,
tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd
result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d
BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_left,
BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_right,
BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413
BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_left,
BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_right,
BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3
tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond,
tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3
result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84
BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_left,
BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_right,
BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f
BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_left,
BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_right,
BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b
result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b
result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1941_c34_1877
CONST_SR_8_uxn_opcodes_h_l1941_c34_1877 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1941_c34_1877_x,
CONST_SR_8_uxn_opcodes_h_l1941_c34_1877_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0
BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_left,
BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_right,
BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a
result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a
result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output,
 t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output,
 t16_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_return_output,
 tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_return_output,
 t16_MUX_uxn_opcodes_h_l1907_c7_239a_return_output,
 CONST_SL_8_uxn_opcodes_h_l1909_c3_7eea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_return_output,
 t16_MUX_uxn_opcodes_h_l1912_c7_459a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_return_output,
 tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output,
 t16_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_return_output,
 MUX_uxn_opcodes_h_l1918_c32_cf8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_return_output,
 tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_return_output,
 CONST_SL_8_uxn_opcodes_h_l1927_c3_2430_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_return_output,
 tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_return_output,
 CONST_SR_8_uxn_opcodes_h_l1941_c34_1877_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_8c94 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1905_c3_15f7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1907_c7_239a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1904_c7_43f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1910_c3_e687 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1912_c7_459a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1907_c7_239a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1909_c3_7eea_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1909_c3_7eea_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1913_c3_6890 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1912_c7_459a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1915_c7_96cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1918_c32_cf8f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1918_c32_cf8f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1918_c32_cf8f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1918_c32_cf8f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1928_c3_f89d : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1927_c3_2430_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1927_c3_2430_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1931_c3_e537 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1936_c3_6df3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1937_c24_d5e4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1940_c3_46c9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1941_c34_1877_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1941_c34_1877_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1941_c24_428d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1904_l1899_l1915_l1912_l1907_DUPLICATE_56bb_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1912_l1939_l1907_DUPLICATE_3a32_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1904_l1899_l1921_l1912_l1907_DUPLICATE_9ce8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1943_l1912_l1939_l1907_DUPLICATE_4fa7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1912_l1907_DUPLICATE_cf85_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1904_l1930_l1925_l1921_l1915_l1943_l1912_l1939_l1907_l1933_DUPLICATE_3c6d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1908_l1916_DUPLICATE_0393_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1930_l1925_l1921_l1915_l1939_DUPLICATE_21b6_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1934_l1926_DUPLICATE_cc33_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1948_l1895_DUPLICATE_f2b4_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1910_c3_e687 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1910_c3_e687;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1936_c3_6df3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1936_c3_6df3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1918_c32_cf8f_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_8c94 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_8c94;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1905_c3_15f7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1905_c3_15f7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1940_c3_46c9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1940_c3_46c9;
     VAR_MUX_uxn_opcodes_h_l1918_c32_cf8f_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1913_c3_6890 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1913_c3_6890;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_right := to_unsigned(5, 3);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1941_c34_1877_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1931_c21_9f7d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1930_c11_08c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1904_l1930_l1925_l1921_l1915_l1943_l1912_l1939_l1907_l1933_DUPLICATE_3c6d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1904_l1930_l1925_l1921_l1915_l1943_l1912_l1939_l1907_l1933_DUPLICATE_3c6d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1943_c11_44e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1939_c11_1e0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1941_c34_1877] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1941_c34_1877_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1941_c34_1877_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1941_c34_1877_return_output := CONST_SR_8_uxn_opcodes_h_l1941_c34_1877_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1925_c11_0bb8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1904_c11_2ad0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1915_c11_14ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1908_l1916_DUPLICATE_0393 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1908_l1916_DUPLICATE_0393_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1912_c11_bb4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1912_l1907_DUPLICATE_cf85 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1912_l1907_DUPLICATE_cf85_return_output := result.ram_addr;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1904_l1899_l1915_l1912_l1907_DUPLICATE_56bb LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1904_l1899_l1915_l1912_l1907_DUPLICATE_56bb_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1904_l1899_l1921_l1912_l1907_DUPLICATE_9ce8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1904_l1899_l1921_l1912_l1907_DUPLICATE_9ce8_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1933_c11_5413] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_left;
     BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_return_output := BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1918_c32_af9b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_left;
     BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_return_output := BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1907_c11_b277] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_left;
     BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_return_output := BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1921_c11_ba60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_left;
     BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_return_output := BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1899_c6_d86f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1934_l1926_DUPLICATE_cc33 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1934_l1926_DUPLICATE_cc33_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1943_l1912_l1939_l1907_DUPLICATE_4fa7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1943_l1912_l1939_l1907_DUPLICATE_4fa7_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1928_c21_c2b3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1930_l1925_l1921_l1915_l1939_DUPLICATE_21b6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1930_l1925_l1921_l1915_l1939_DUPLICATE_21b6_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1912_l1939_l1907_DUPLICATE_3a32 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1912_l1939_l1907_DUPLICATE_3a32_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_af9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d86f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1904_c7_43f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_2ad0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1907_c7_239a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_b277_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1912_c7_459a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_bb4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1915_c7_96cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_14ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_ba60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_0bb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_08c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_5413_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_1e0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_44e0_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1928_c3_f89d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_c2b3_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l1931_c3_e537 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_9f7d_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1908_l1916_DUPLICATE_0393_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1909_c3_7eea_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1908_l1916_DUPLICATE_0393_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1934_l1926_DUPLICATE_cc33_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1927_c3_2430_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1934_l1926_DUPLICATE_cc33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1904_l1899_l1915_l1912_l1907_DUPLICATE_56bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1904_l1899_l1915_l1912_l1907_DUPLICATE_56bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1904_l1899_l1915_l1912_l1907_DUPLICATE_56bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1904_l1899_l1915_l1912_l1907_DUPLICATE_56bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1904_l1899_l1915_l1912_l1907_DUPLICATE_56bb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1912_l1907_DUPLICATE_cf85_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1912_l1907_DUPLICATE_cf85_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1912_l1907_DUPLICATE_cf85_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1912_l1907_DUPLICATE_cf85_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1912_l1907_DUPLICATE_cf85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1904_l1930_l1925_l1921_l1915_l1943_l1912_l1939_l1907_l1933_DUPLICATE_3c6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1904_l1930_l1925_l1921_l1915_l1943_l1912_l1939_l1907_l1933_DUPLICATE_3c6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1904_l1930_l1925_l1921_l1915_l1943_l1912_l1939_l1907_l1933_DUPLICATE_3c6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1904_l1930_l1925_l1921_l1915_l1943_l1912_l1939_l1907_l1933_DUPLICATE_3c6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1904_l1930_l1925_l1921_l1915_l1943_l1912_l1939_l1907_l1933_DUPLICATE_3c6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1904_l1930_l1925_l1921_l1915_l1943_l1912_l1939_l1907_l1933_DUPLICATE_3c6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1904_l1930_l1925_l1921_l1915_l1943_l1912_l1939_l1907_l1933_DUPLICATE_3c6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1904_l1930_l1925_l1921_l1915_l1943_l1912_l1939_l1907_l1933_DUPLICATE_3c6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1904_l1930_l1925_l1921_l1915_l1943_l1912_l1939_l1907_l1933_DUPLICATE_3c6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1904_l1930_l1925_l1921_l1915_l1943_l1912_l1939_l1907_l1933_DUPLICATE_3c6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1904_l1899_l1921_l1912_l1907_DUPLICATE_9ce8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1904_l1899_l1921_l1912_l1907_DUPLICATE_9ce8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1904_l1899_l1921_l1912_l1907_DUPLICATE_9ce8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1904_l1899_l1921_l1912_l1907_DUPLICATE_9ce8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1904_l1899_l1921_l1912_l1907_DUPLICATE_9ce8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1943_l1912_l1939_l1907_DUPLICATE_4fa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1943_l1912_l1939_l1907_DUPLICATE_4fa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1943_l1912_l1939_l1907_DUPLICATE_4fa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1943_l1912_l1939_l1907_DUPLICATE_4fa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1943_l1912_l1939_l1907_DUPLICATE_4fa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1943_l1912_l1939_l1907_DUPLICATE_4fa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1943_l1912_l1939_l1907_DUPLICATE_4fa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1943_l1912_l1939_l1907_DUPLICATE_4fa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1943_l1912_l1939_l1907_DUPLICATE_4fa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1943_l1912_l1939_l1907_DUPLICATE_4fa7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1930_l1925_l1921_l1915_l1939_DUPLICATE_21b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1930_l1925_l1921_l1915_l1939_DUPLICATE_21b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1930_l1925_l1921_l1915_l1939_DUPLICATE_21b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1930_l1925_l1921_l1915_l1939_DUPLICATE_21b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1930_l1925_l1921_l1915_l1939_DUPLICATE_21b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1912_l1939_l1907_DUPLICATE_3a32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1912_l1939_l1907_DUPLICATE_3a32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1912_l1939_l1907_DUPLICATE_3a32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1912_l1939_l1907_DUPLICATE_3a32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1912_l1939_l1907_DUPLICATE_3a32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1912_l1939_l1907_DUPLICATE_3a32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1912_l1939_l1907_DUPLICATE_3a32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1912_l1939_l1907_DUPLICATE_3a32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1904_l1930_l1899_l1925_l1921_l1915_l1912_l1939_l1907_DUPLICATE_3a32_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1928_c3_f89d;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1931_c3_e537;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1943_c7_017a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1934_c3_af84] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_left;
     BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_return_output := BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1941_c24_428d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1941_c24_428d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1941_c34_1877_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1943_c7_017a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1927_c3_2430] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1927_c3_2430_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1927_c3_2430_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1927_c3_2430_return_output := CONST_SL_8_uxn_opcodes_h_l1927_c3_2430_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1918_c32_d812] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_left;
     BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_return_output := BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1939_c7_445b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1909_c3_7eea] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1909_c3_7eea_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1909_c3_7eea_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1909_c3_7eea_return_output := CONST_SL_8_uxn_opcodes_h_l1909_c3_7eea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1921_c7_ecdb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1916_c3_74ba] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_left;
     BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_return_output := BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1930_c7_dafd] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1918_c32_cf8f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_d812_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_74ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1941_c24_428d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1909_c3_7eea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1927_c3_2430_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_017a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_017a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_445b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1933_c7_9bd3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output;

     -- MUX[uxn_opcodes_h_l1918_c32_cf8f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1918_c32_cf8f_cond <= VAR_MUX_uxn_opcodes_h_l1918_c32_cf8f_cond;
     MUX_uxn_opcodes_h_l1918_c32_cf8f_iftrue <= VAR_MUX_uxn_opcodes_h_l1918_c32_cf8f_iftrue;
     MUX_uxn_opcodes_h_l1918_c32_cf8f_iffalse <= VAR_MUX_uxn_opcodes_h_l1918_c32_cf8f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1918_c32_cf8f_return_output := MUX_uxn_opcodes_h_l1918_c32_cf8f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1915_c7_96cb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1915_c7_96cb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1915_c7_96cb_cond;
     t16_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue;
     t16_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output := t16_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1939_c7_445b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1915_c7_96cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1925_c7_d111] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1939_c7_445b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1933_c7_9bd3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond;
     tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output := tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1939_c7_445b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1937_c24_d5e4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1937_c24_d5e4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_af84_return_output);

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1937_c24_d5e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue := VAR_MUX_uxn_opcodes_h_l1918_c32_cf8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_445b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_445b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_d111_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_445b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1915_c7_96cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1933_c7_9bd3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1930_c7_dafd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_cond;
     tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output := tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1912_c7_459a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1933_c7_9bd3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1912_c7_459a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1912_c7_459a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1912_c7_459a_cond;
     t16_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue;
     t16_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1912_c7_459a_return_output := t16_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1933_c7_9bd3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1921_c7_ecdb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1930_c7_dafd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_9bd3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1930_c7_dafd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1925_c7_d111] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_return_output;

     -- t16_MUX[uxn_opcodes_h_l1907_c7_239a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1907_c7_239a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1907_c7_239a_cond;
     t16_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue;
     t16_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1907_c7_239a_return_output := t16_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1907_c7_239a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1930_c7_dafd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1930_c7_dafd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1915_c7_96cb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1912_c7_459a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1925_c7_d111] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_cond;
     tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_return_output := tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_d111_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_dafd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_d111_return_output;
     -- t16_MUX[uxn_opcodes_h_l1904_c7_43f8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1904_c7_43f8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1904_c7_43f8_cond;
     t16_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue;
     t16_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output := t16_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1921_c7_ecdb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1921_c7_ecdb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond;
     tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output := tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1907_c7_239a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1912_c7_459a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1904_c7_43f8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1925_c7_d111] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_return_output := result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1925_c7_d111] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1925_c7_d111] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_d111_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_d111_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_d111_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1915_c7_96cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1907_c7_239a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1899_c2_bb0a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1921_c7_ecdb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1915_c7_96cb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_cond;
     tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output := tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1921_c7_ecdb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1921_c7_ecdb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output;

     -- t16_MUX[uxn_opcodes_h_l1899_c2_bb0a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond;
     t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue;
     t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output := t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1904_c7_43f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_ecdb_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1899_c2_bb0a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1915_c7_96cb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1912_c7_459a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_cond;
     tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_return_output := tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1912_c7_459a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1915_c7_96cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1904_c7_43f8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1915_c7_96cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_96cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1912_c7_459a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1907_c7_239a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_cond;
     tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_return_output := tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1907_c7_239a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1912_c7_459a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1912_c7_459a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1899_c2_bb0a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_459a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1904_c7_43f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1907_c7_239a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1907_c7_239a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1907_c7_239a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1904_c7_43f8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_cond;
     tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output := tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_239a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1904_c7_43f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1899_c2_bb0a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1904_c7_43f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1904_c7_43f8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1899_c2_bb0a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond;
     tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output := tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_43f8_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1899_c2_bb0a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1899_c2_bb0a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1899_c2_bb0a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1948_l1895_DUPLICATE_f2b4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1948_l1895_DUPLICATE_f2b4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a287(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_bb0a_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1948_l1895_DUPLICATE_f2b4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1948_l1895_DUPLICATE_f2b4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
