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
-- Submodules: 103
entity lda2_0CLK_2b0015ee is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_2b0015ee;
architecture arch of lda2_0CLK_2b0015ee is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1899_c6_d7bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1899_c1_d187]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1899_c2_13b5]
signal tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1899_c2_13b5]
signal t16_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1899_c2_13b5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1899_c2_13b5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1899_c2_13b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1899_c2_13b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1899_c2_13b5]
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1899_c2_13b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1899_c2_13b5]
signal result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1900_c3_2518[uxn_opcodes_h_l1900_c3_2518]
signal printf_uxn_opcodes_h_l1900_c3_2518_uxn_opcodes_h_l1900_c3_2518_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1904_c11_d99b]
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1904_c7_0300]
signal tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1904_c7_0300]
signal t16_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1904_c7_0300]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1904_c7_0300]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1904_c7_0300]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1904_c7_0300]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1904_c7_0300]
signal result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1904_c7_0300]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1904_c7_0300]
signal result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1907_c11_3667]
signal BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1907_c7_5abd]
signal tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1907_c7_5abd]
signal t16_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1907_c7_5abd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1907_c7_5abd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1907_c7_5abd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1907_c7_5abd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1907_c7_5abd]
signal result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1907_c7_5abd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1907_c7_5abd]
signal result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1909_c3_c77e]
signal CONST_SL_8_uxn_opcodes_h_l1909_c3_c77e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1909_c3_c77e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1912_c11_0259]
signal BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1912_c7_6031]
signal tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1912_c7_6031]
signal t16_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1912_c7_6031]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1912_c7_6031]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1912_c7_6031]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1912_c7_6031]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1912_c7_6031]
signal result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1912_c7_6031]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1912_c7_6031]
signal result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1915_c11_128a]
signal BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1915_c7_2b1f]
signal tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1915_c7_2b1f]
signal t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1915_c7_2b1f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1915_c7_2b1f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1915_c7_2b1f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1915_c7_2b1f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1915_c7_2b1f]
signal result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1915_c7_2b1f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1915_c7_2b1f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1916_c3_8c1f]
signal BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1918_c32_8ff8]
signal BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1918_c32_1aec]
signal BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1918_c32_b996]
signal MUX_uxn_opcodes_h_l1918_c32_b996_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1918_c32_b996_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1918_c32_b996_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1918_c32_b996_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1921_c11_fc6a]
signal BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1921_c7_26f3]
signal tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1921_c7_26f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1921_c7_26f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1921_c7_26f3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1921_c7_26f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1921_c7_26f3]
signal result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1921_c7_26f3]
signal result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1925_c11_3dd3]
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1925_c7_5041]
signal tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1925_c7_5041]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1925_c7_5041]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1925_c7_5041]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1925_c7_5041]
signal result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1925_c7_5041]
signal result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1927_c3_59c4]
signal CONST_SL_8_uxn_opcodes_h_l1927_c3_59c4_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1927_c3_59c4_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1928_c21_b244]
signal BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1930_c11_3fb6]
signal BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1930_c7_969f]
signal tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1930_c7_969f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1930_c7_969f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1930_c7_969f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1930_c7_969f]
signal result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1930_c7_969f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1931_c21_3618]
signal BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1933_c11_3867]
signal BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1933_c7_b069]
signal tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1933_c7_b069]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1933_c7_b069]
signal result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1933_c7_b069]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1933_c7_b069]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1934_c3_4d3d]
signal BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1939_c11_babe]
signal BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1939_c7_2510]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1939_c7_2510]
signal result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1939_c7_2510]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1939_c7_2510]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1941_c34_077e]
signal CONST_SR_8_uxn_opcodes_h_l1941_c34_077e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1941_c34_077e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1943_c11_d7a3]
signal BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1943_c7_b245]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1943_c7_b245]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5b20( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.ram_addr := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb
BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5
tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_cond,
tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output);

-- t16_MUX_uxn_opcodes_h_l1899_c2_13b5
t16_MUX_uxn_opcodes_h_l1899_c2_13b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1899_c2_13b5_cond,
t16_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue,
t16_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse,
t16_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5
result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5
result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output);

-- printf_uxn_opcodes_h_l1900_c3_2518_uxn_opcodes_h_l1900_c3_2518
printf_uxn_opcodes_h_l1900_c3_2518_uxn_opcodes_h_l1900_c3_2518 : entity work.printf_uxn_opcodes_h_l1900_c3_2518_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1900_c3_2518_uxn_opcodes_h_l1900_c3_2518_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_left,
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_right,
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1904_c7_0300
tmp16_MUX_uxn_opcodes_h_l1904_c7_0300 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_cond,
tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue,
tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse,
tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_return_output);

-- t16_MUX_uxn_opcodes_h_l1904_c7_0300
t16_MUX_uxn_opcodes_h_l1904_c7_0300 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1904_c7_0300_cond,
t16_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue,
t16_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse,
t16_MUX_uxn_opcodes_h_l1904_c7_0300_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300
result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300
result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_cond,
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300
result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667
BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_left,
BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_right,
BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd
tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_cond,
tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output);

-- t16_MUX_uxn_opcodes_h_l1907_c7_5abd
t16_MUX_uxn_opcodes_h_l1907_c7_5abd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1907_c7_5abd_cond,
t16_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue,
t16_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse,
t16_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd
result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd
result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd
result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd
result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd
result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1909_c3_c77e
CONST_SL_8_uxn_opcodes_h_l1909_c3_c77e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1909_c3_c77e_x,
CONST_SL_8_uxn_opcodes_h_l1909_c3_c77e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259
BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_left,
BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_right,
BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1912_c7_6031
tmp16_MUX_uxn_opcodes_h_l1912_c7_6031 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_cond,
tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue,
tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse,
tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_return_output);

-- t16_MUX_uxn_opcodes_h_l1912_c7_6031
t16_MUX_uxn_opcodes_h_l1912_c7_6031 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1912_c7_6031_cond,
t16_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue,
t16_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse,
t16_MUX_uxn_opcodes_h_l1912_c7_6031_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031
result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031
result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031
result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031
result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_cond,
result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031
result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031
result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a
BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_left,
BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_right,
BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f
tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond,
tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output);

-- t16_MUX_uxn_opcodes_h_l1915_c7_2b1f
t16_MUX_uxn_opcodes_h_l1915_c7_2b1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond,
t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue,
t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse,
t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f
result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f
result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f
result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f
BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_left,
BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_right,
BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8
BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_left,
BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_right,
BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec
BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_left,
BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_right,
BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_return_output);

-- MUX_uxn_opcodes_h_l1918_c32_b996
MUX_uxn_opcodes_h_l1918_c32_b996 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1918_c32_b996_cond,
MUX_uxn_opcodes_h_l1918_c32_b996_iftrue,
MUX_uxn_opcodes_h_l1918_c32_b996_iffalse,
MUX_uxn_opcodes_h_l1918_c32_b996_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a
BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_left,
BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_right,
BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3
tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_cond,
tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3
result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3
result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3
result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3
BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_left,
BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_right,
BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1925_c7_5041
tmp16_MUX_uxn_opcodes_h_l1925_c7_5041 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_cond,
tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue,
tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse,
tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041
result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_cond,
result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041
result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1927_c3_59c4
CONST_SL_8_uxn_opcodes_h_l1927_c3_59c4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1927_c3_59c4_x,
CONST_SL_8_uxn_opcodes_h_l1927_c3_59c4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244
BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_left,
BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_right,
BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_left,
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_right,
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1930_c7_969f
tmp16_MUX_uxn_opcodes_h_l1930_c7_969f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_cond,
tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f
result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618
BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_left,
BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_right,
BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867
BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_left,
BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_right,
BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1933_c7_b069
tmp16_MUX_uxn_opcodes_h_l1933_c7_b069 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_cond,
tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue,
tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse,
tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069
result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_cond,
result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d
BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_left,
BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_right,
BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe
BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_left,
BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_right,
BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510
result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_cond,
result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510
result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1941_c34_077e
CONST_SR_8_uxn_opcodes_h_l1941_c34_077e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1941_c34_077e_x,
CONST_SR_8_uxn_opcodes_h_l1941_c34_077e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3
BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_left,
BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_right,
BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245
result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245
result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_return_output,
 tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output,
 t16_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_return_output,
 t16_MUX_uxn_opcodes_h_l1904_c7_0300_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_return_output,
 tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output,
 t16_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output,
 CONST_SL_8_uxn_opcodes_h_l1909_c3_c77e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_return_output,
 tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_return_output,
 t16_MUX_uxn_opcodes_h_l1912_c7_6031_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output,
 t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_return_output,
 MUX_uxn_opcodes_h_l1918_c32_b996_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_return_output,
 CONST_SL_8_uxn_opcodes_h_l1927_c3_59c4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_return_output,
 tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_return_output,
 CONST_SR_8_uxn_opcodes_h_l1941_c34_077e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_3501 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1900_c3_2518_uxn_opcodes_h_l1900_c3_2518_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1905_c3_11f3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1910_c3_4858 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1909_c3_c77e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1909_c3_c77e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1913_c3_1fa4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1918_c32_b996_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1918_c32_b996_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1918_c32_b996_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1918_c32_b996_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1928_c3_0b07 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1927_c3_59c4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1927_c3_59c4_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1931_c3_5eb1 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1936_c3_8cdf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1937_c24_be02_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1940_c3_771e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1941_c34_077e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1941_c34_077e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1941_c24_ee52_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_7c3c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1912_l1907_l1904_l1899_l1921_DUPLICATE_70d4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1915_l1912_l1907_l1904_l1899_DUPLICATE_238c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1915_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_5d09_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1912_l1907_l1904_l1930_l1899_DUPLICATE_b616_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1933_l1904_l1930_l1925_l1921_DUPLICATE_5266_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1916_l1908_DUPLICATE_9fad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1915_l1939_l1930_l1925_l1921_DUPLICATE_8a22_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1926_l1934_DUPLICATE_831a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1948_l1895_DUPLICATE_ab9d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1940_c3_771e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1940_c3_771e;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1910_c3_4858 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1910_c3_4858;
     VAR_MUX_uxn_opcodes_h_l1918_c32_b996_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_3501 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_3501;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1913_c3_1fa4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1913_c3_1fa4;
     VAR_MUX_uxn_opcodes_h_l1918_c32_b996_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_right := to_unsigned(9, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1936_c3_8cdf := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1936_c3_8cdf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1905_c3_11f3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1905_c3_11f3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_right := to_unsigned(10, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1941_c34_077e_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse := tmp16;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1915_l1912_l1907_l1904_l1899_DUPLICATE_238c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1915_l1912_l1907_l1904_l1899_DUPLICATE_238c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1925_c11_3dd3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1915_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_5d09 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1915_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_5d09_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1907_c11_3667] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_left;
     BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_return_output := BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1943_c11_d7a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1933_c11_3867] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_left;
     BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_return_output := BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1941_c34_077e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1941_c34_077e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1941_c34_077e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1941_c34_077e_return_output := CONST_SR_8_uxn_opcodes_h_l1941_c34_077e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1912_l1907_l1904_l1899_l1921_DUPLICATE_70d4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1912_l1907_l1904_l1899_l1921_DUPLICATE_70d4_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_7c3c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_7c3c_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1926_l1934_DUPLICATE_831a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1926_l1934_DUPLICATE_831a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1904_c11_d99b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1931_c21_3618] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1928_c21_b244] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1899_c6_d7bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1921_c11_fc6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1916_l1908_DUPLICATE_9fad LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1916_l1908_DUPLICATE_9fad_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1912_c11_0259] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_left;
     BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_return_output := BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1912_l1907_l1904_l1930_l1899_DUPLICATE_b616 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1912_l1907_l1904_l1930_l1899_DUPLICATE_b616_return_output := result.ram_addr;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1915_l1939_l1930_l1925_l1921_DUPLICATE_8a22 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1915_l1939_l1930_l1925_l1921_DUPLICATE_8a22_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l1918_c32_8ff8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_left;
     BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_return_output := BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1939_c11_babe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1933_l1904_l1930_l1925_l1921_DUPLICATE_5266 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1933_l1904_l1930_l1925_l1921_DUPLICATE_5266_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1915_c11_128a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1930_c11_3fb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_8ff8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1899_c2_13b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c6_d7bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1904_c7_0300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d99b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1907_c7_5abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_3667_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1912_c7_6031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_0259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_128a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_fc6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c11_3dd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_3fb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_3867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_babe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1943_c11_d7a3_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1928_c3_0b07 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1928_c21_b244_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l1931_c3_5eb1 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1931_c21_3618_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1916_l1908_DUPLICATE_9fad_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1909_c3_c77e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1916_l1908_DUPLICATE_9fad_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1926_l1934_DUPLICATE_831a_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1927_c3_59c4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1926_l1934_DUPLICATE_831a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1915_l1912_l1907_l1904_l1899_DUPLICATE_238c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1915_l1912_l1907_l1904_l1899_DUPLICATE_238c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1915_l1912_l1907_l1904_l1899_DUPLICATE_238c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1915_l1912_l1907_l1904_l1899_DUPLICATE_238c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1915_l1912_l1907_l1904_l1899_DUPLICATE_238c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1912_l1907_l1904_l1930_l1899_DUPLICATE_b616_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1912_l1907_l1904_l1930_l1899_DUPLICATE_b616_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1912_l1907_l1904_l1930_l1899_DUPLICATE_b616_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1912_l1907_l1904_l1930_l1899_DUPLICATE_b616_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1912_l1907_l1904_l1930_l1899_DUPLICATE_b616_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1933_l1904_l1930_l1925_l1921_DUPLICATE_5266_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1933_l1904_l1930_l1925_l1921_DUPLICATE_5266_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1933_l1904_l1930_l1925_l1921_DUPLICATE_5266_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1933_l1904_l1930_l1925_l1921_DUPLICATE_5266_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1933_l1904_l1930_l1925_l1921_DUPLICATE_5266_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1933_l1904_l1930_l1925_l1921_DUPLICATE_5266_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1933_l1904_l1930_l1925_l1921_DUPLICATE_5266_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1933_l1904_l1930_l1925_l1921_DUPLICATE_5266_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1933_l1904_l1930_l1925_l1921_DUPLICATE_5266_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1933_l1904_l1930_l1925_l1921_DUPLICATE_5266_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1912_l1907_l1904_l1899_l1921_DUPLICATE_70d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1912_l1907_l1904_l1899_l1921_DUPLICATE_70d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1912_l1907_l1904_l1899_l1921_DUPLICATE_70d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1912_l1907_l1904_l1899_l1921_DUPLICATE_70d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1912_l1907_l1904_l1899_l1921_DUPLICATE_70d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_7c3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_7c3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_7c3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_7c3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_7c3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_7c3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_7c3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_7c3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_7c3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1915_l1943_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_7c3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1915_l1939_l1930_l1925_l1921_DUPLICATE_8a22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1915_l1939_l1930_l1925_l1921_DUPLICATE_8a22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1915_l1939_l1930_l1925_l1921_DUPLICATE_8a22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1915_l1939_l1930_l1925_l1921_DUPLICATE_8a22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1915_l1939_l1930_l1925_l1921_DUPLICATE_8a22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1915_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_5d09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1915_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_5d09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1915_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_5d09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1915_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_5d09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1915_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_5d09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1915_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_5d09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1915_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_5d09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1915_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_5d09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1915_l1912_l1939_l1907_l1904_l1930_l1899_l1925_l1921_DUPLICATE_5d09_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1928_c3_0b07;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1931_c3_5eb1;
     -- BIN_OP_OR[uxn_opcodes_h_l1916_c3_8c1f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_left;
     BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_return_output := BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1921_c7_26f3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1930_c7_969f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1918_c32_1aec] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_left;
     BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_return_output := BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1941_c24_ee52] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1941_c24_ee52_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1941_c34_077e_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1943_c7_b245] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1943_c7_b245] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1927_c3_59c4] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1927_c3_59c4_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1927_c3_59c4_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1927_c3_59c4_return_output := CONST_SL_8_uxn_opcodes_h_l1927_c3_59c4_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1909_c3_c77e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1909_c3_c77e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1909_c3_c77e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1909_c3_c77e_return_output := CONST_SL_8_uxn_opcodes_h_l1909_c3_c77e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1939_c7_2510] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1899_c1_d187] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1934_c3_4d3d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_left;
     BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_return_output := BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1918_c32_b996_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_1aec_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1916_c3_8c1f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1941_c24_ee52_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1909_c3_c77e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1927_c3_59c4_return_output;
     VAR_printf_uxn_opcodes_h_l1900_c3_2518_uxn_opcodes_h_l1900_c3_2518_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1899_c1_d187_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1943_c7_b245_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1943_c7_b245_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1930_c7_969f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_2510_return_output;
     -- t16_MUX[uxn_opcodes_h_l1915_c7_2b1f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond;
     t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue;
     t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output := t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1937_c24_be02] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1937_c24_be02_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1934_c3_4d3d_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1939_c7_2510] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1933_c7_b069] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1939_c7_2510] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_return_output := result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_return_output;

     -- printf_uxn_opcodes_h_l1900_c3_2518[uxn_opcodes_h_l1900_c3_2518] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1900_c3_2518_uxn_opcodes_h_l1900_c3_2518_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1900_c3_2518_uxn_opcodes_h_l1900_c3_2518_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l1918_c32_b996] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1918_c32_b996_cond <= VAR_MUX_uxn_opcodes_h_l1918_c32_b996_cond;
     MUX_uxn_opcodes_h_l1918_c32_b996_iftrue <= VAR_MUX_uxn_opcodes_h_l1918_c32_b996_iftrue;
     MUX_uxn_opcodes_h_l1918_c32_b996_iffalse <= VAR_MUX_uxn_opcodes_h_l1918_c32_b996_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1918_c32_b996_return_output := MUX_uxn_opcodes_h_l1918_c32_b996_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1925_c7_5041] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1933_c7_b069] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_cond;
     tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_return_output := tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1915_c7_2b1f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1939_c7_2510] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1937_c24_be02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue := VAR_MUX_uxn_opcodes_h_l1918_c32_b996_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_2510_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_2510_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1925_c7_5041_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c7_b069_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1939_c7_2510_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1933_c7_b069_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1933_c7_b069] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_return_output;

     -- t16_MUX[uxn_opcodes_h_l1912_c7_6031] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1912_c7_6031_cond <= VAR_t16_MUX_uxn_opcodes_h_l1912_c7_6031_cond;
     t16_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue;
     t16_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1912_c7_6031_return_output := t16_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1930_c7_969f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_cond;
     tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_return_output := tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1912_c7_6031] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1933_c7_b069] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_return_output := result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1915_c7_2b1f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1933_c7_b069] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1930_c7_969f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1921_c7_26f3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_b069_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_b069_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_969f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1933_c7_b069_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1930_c7_969f_return_output;
     -- t16_MUX[uxn_opcodes_h_l1907_c7_5abd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1907_c7_5abd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1907_c7_5abd_cond;
     t16_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue;
     t16_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output := t16_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1915_c7_2b1f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1907_c7_5abd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1930_c7_969f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1925_c7_5041] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1930_c7_969f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1912_c7_6031] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1930_c7_969f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1925_c7_5041] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_cond;
     tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_return_output := tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_969f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_969f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c7_5041_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_969f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1925_c7_5041_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1912_c7_6031] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;

     -- t16_MUX[uxn_opcodes_h_l1904_c7_0300] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1904_c7_0300_cond <= VAR_t16_MUX_uxn_opcodes_h_l1904_c7_0300_cond;
     t16_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue;
     t16_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1904_c7_0300_return_output := t16_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1925_c7_5041] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_return_output := result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1921_c7_26f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1907_c7_5abd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1925_c7_5041] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1921_c7_26f3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_cond;
     tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output := tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1925_c7_5041] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1904_c7_0300] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c7_5041_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c7_5041_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1925_c7_5041_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1907_c7_5abd] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1904_c7_0300] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;

     -- t16_MUX[uxn_opcodes_h_l1899_c2_13b5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1899_c2_13b5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1899_c2_13b5_cond;
     t16_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue;
     t16_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output := t16_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1921_c7_26f3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1915_c7_2b1f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1921_c7_26f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1921_c7_26f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1915_c7_2b1f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond;
     tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output := tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1899_c2_13b5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_26f3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1912_c7_6031] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_cond;
     tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_return_output := tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1912_c7_6031] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1915_c7_2b1f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1904_c7_0300] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1915_c7_2b1f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1915_c7_2b1f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1899_c2_13b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1915_c7_2b1f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1912_c7_6031] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1899_c2_13b5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1912_c7_6031] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_return_output := result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1912_c7_6031] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1907_c7_5abd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_cond;
     tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output := tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1907_c7_5abd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_6031_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1904_c7_0300] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1904_c7_0300] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_cond;
     tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_return_output := tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1907_c7_5abd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1907_c7_5abd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1907_c7_5abd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1907_c7_5abd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1904_c7_0300] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_return_output := result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1904_c7_0300] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1904_c7_0300] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1899_c2_13b5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_cond;
     tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output := tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1899_c2_13b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_0300_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1899_c2_13b5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1899_c2_13b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1899_c2_13b5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1948_l1895_DUPLICATE_ab9d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1948_l1895_DUPLICATE_ab9d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b20(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c2_13b5_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1948_l1895_DUPLICATE_ab9d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1948_l1895_DUPLICATE_ab9d_return_output;
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
