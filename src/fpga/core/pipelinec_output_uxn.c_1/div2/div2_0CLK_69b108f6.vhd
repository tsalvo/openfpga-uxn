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
-- Submodules: 107
entity div2_0CLK_69b108f6 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_69b108f6;
architecture arch of div2_0CLK_69b108f6 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2224_c6_43f5]
signal BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2224_c2_d27d]
signal tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2224_c2_d27d]
signal n16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2224_c2_d27d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2224_c2_d27d]
signal result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2224_c2_d27d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2224_c2_d27d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2224_c2_d27d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2224_c2_d27d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2224_c2_d27d]
signal t16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2229_c11_e658]
signal BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2229_c7_761b]
signal tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2229_c7_761b]
signal n16_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2229_c7_761b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2229_c7_761b]
signal result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2229_c7_761b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2229_c7_761b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2229_c7_761b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2229_c7_761b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2229_c7_761b]
signal t16_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2232_c11_9ef0]
signal BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2232_c7_04b6]
signal tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2232_c7_04b6]
signal n16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2232_c7_04b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2232_c7_04b6]
signal result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2232_c7_04b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2232_c7_04b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2232_c7_04b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2232_c7_04b6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2232_c7_04b6]
signal t16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2237_c11_898a]
signal BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2237_c7_b8ee]
signal tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2237_c7_b8ee]
signal n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2237_c7_b8ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2237_c7_b8ee]
signal result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2237_c7_b8ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2237_c7_b8ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2237_c7_b8ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2237_c7_b8ee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2237_c7_b8ee]
signal t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2240_c11_703e]
signal BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2240_c7_407d]
signal tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2240_c7_407d]
signal n16_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2240_c7_407d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2240_c7_407d]
signal result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2240_c7_407d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2240_c7_407d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2240_c7_407d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2240_c7_407d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2240_c7_407d]
signal t16_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2241_c3_c5bd]
signal BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2244_c11_074b]
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2244_c7_3573]
signal tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2244_c7_3573]
signal n16_MUX_uxn_opcodes_h_l2244_c7_3573_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2244_c7_3573_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2244_c7_3573]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2244_c7_3573]
signal result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2244_c7_3573]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2244_c7_3573]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2244_c7_3573]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2244_c7_3573]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2247_c11_9fa5]
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2247_c7_85dc]
signal tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2247_c7_85dc]
signal n16_MUX_uxn_opcodes_h_l2247_c7_85dc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2247_c7_85dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2247_c7_85dc]
signal result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2247_c7_85dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2247_c7_85dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2247_c7_85dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2247_c7_85dc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2252_c11_a20b]
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2252_c7_026b]
signal tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2252_c7_026b]
signal n16_MUX_uxn_opcodes_h_l2252_c7_026b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c7_026b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c7_026b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2252_c7_026b]
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c7_026b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c7_026b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c7_026b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2252_c7_026b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2255_c11_5b68]
signal BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2255_c7_eeb6]
signal tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2255_c7_eeb6]
signal n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2255_c7_eeb6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2255_c7_eeb6]
signal result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2255_c7_eeb6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2255_c7_eeb6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2255_c7_eeb6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2255_c7_eeb6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2256_c3_d464]
signal BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2257_c11_c571]
signal BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2257_c26_9329]
signal BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2257_c11_0fcd]
signal MUX_uxn_opcodes_h_l2257_c11_0fcd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2257_c11_0fcd_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2257_c11_0fcd_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2257_c11_0fcd_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2259_c30_c577]
signal sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2264_c11_fe23]
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2264_c7_3860]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2264_c7_3860]
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2264_c7_3860]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2264_c7_3860]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2264_c7_3860]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2267_c31_a069]
signal CONST_SR_8_uxn_opcodes_h_l2267_c31_a069_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2267_c31_a069_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2269_c11_d940]
signal BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2269_c7_6f60]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2269_c7_6f60]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_3345( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5
BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_left,
BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_right,
BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d
tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond,
tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output);

-- n16_MUX_uxn_opcodes_h_l2224_c2_d27d
n16_MUX_uxn_opcodes_h_l2224_c2_d27d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond,
n16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue,
n16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse,
n16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d
result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d
result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output);

-- t16_MUX_uxn_opcodes_h_l2224_c2_d27d
t16_MUX_uxn_opcodes_h_l2224_c2_d27d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond,
t16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue,
t16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse,
t16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_left,
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_right,
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2229_c7_761b
tmp16_MUX_uxn_opcodes_h_l2229_c7_761b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_cond,
tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output);

-- n16_MUX_uxn_opcodes_h_l2229_c7_761b
n16_MUX_uxn_opcodes_h_l2229_c7_761b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2229_c7_761b_cond,
n16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue,
n16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse,
n16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b
result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_return_output);

-- t16_MUX_uxn_opcodes_h_l2229_c7_761b
t16_MUX_uxn_opcodes_h_l2229_c7_761b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2229_c7_761b_cond,
t16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue,
t16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse,
t16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0
BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_left,
BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_right,
BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6
tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond,
tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output);

-- n16_MUX_uxn_opcodes_h_l2232_c7_04b6
n16_MUX_uxn_opcodes_h_l2232_c7_04b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond,
n16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue,
n16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse,
n16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6
result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6
result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6
result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6
result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output);

-- t16_MUX_uxn_opcodes_h_l2232_c7_04b6
t16_MUX_uxn_opcodes_h_l2232_c7_04b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond,
t16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue,
t16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse,
t16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a
BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_left,
BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_right,
BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee
tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond,
tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue,
tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse,
tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output);

-- n16_MUX_uxn_opcodes_h_l2237_c7_b8ee
n16_MUX_uxn_opcodes_h_l2237_c7_b8ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond,
n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue,
n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse,
n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee
result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond,
result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output);

-- t16_MUX_uxn_opcodes_h_l2237_c7_b8ee
t16_MUX_uxn_opcodes_h_l2237_c7_b8ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond,
t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue,
t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse,
t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e
BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_left,
BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_right,
BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2240_c7_407d
tmp16_MUX_uxn_opcodes_h_l2240_c7_407d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_cond,
tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output);

-- n16_MUX_uxn_opcodes_h_l2240_c7_407d
n16_MUX_uxn_opcodes_h_l2240_c7_407d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2240_c7_407d_cond,
n16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue,
n16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse,
n16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d
result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d
result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d
result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d
result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_return_output);

-- t16_MUX_uxn_opcodes_h_l2240_c7_407d
t16_MUX_uxn_opcodes_h_l2240_c7_407d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2240_c7_407d_cond,
t16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue,
t16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse,
t16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd
BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_left,
BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_right,
BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_left,
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_right,
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2244_c7_3573
tmp16_MUX_uxn_opcodes_h_l2244_c7_3573 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_cond,
tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue,
tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse,
tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_return_output);

-- n16_MUX_uxn_opcodes_h_l2244_c7_3573
n16_MUX_uxn_opcodes_h_l2244_c7_3573 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2244_c7_3573_cond,
n16_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue,
n16_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse,
n16_MUX_uxn_opcodes_h_l2244_c7_3573_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573
result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_cond,
result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_left,
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_right,
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc
tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_cond,
tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue,
tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse,
tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output);

-- n16_MUX_uxn_opcodes_h_l2247_c7_85dc
n16_MUX_uxn_opcodes_h_l2247_c7_85dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2247_c7_85dc_cond,
n16_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue,
n16_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse,
n16_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc
result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc
result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_left,
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_right,
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2252_c7_026b
tmp16_MUX_uxn_opcodes_h_l2252_c7_026b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_cond,
tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_return_output);

-- n16_MUX_uxn_opcodes_h_l2252_c7_026b
n16_MUX_uxn_opcodes_h_l2252_c7_026b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2252_c7_026b_cond,
n16_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue,
n16_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse,
n16_MUX_uxn_opcodes_h_l2252_c7_026b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b
result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68
BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_left,
BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_right,
BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6
tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond,
tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output);

-- n16_MUX_uxn_opcodes_h_l2255_c7_eeb6
n16_MUX_uxn_opcodes_h_l2255_c7_eeb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond,
n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue,
n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse,
n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6
result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6
result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6
result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6
result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464
BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_left,
BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_right,
BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571
BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_left,
BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_right,
BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329
BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_left,
BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_right,
BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_return_output);

-- MUX_uxn_opcodes_h_l2257_c11_0fcd
MUX_uxn_opcodes_h_l2257_c11_0fcd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2257_c11_0fcd_cond,
MUX_uxn_opcodes_h_l2257_c11_0fcd_iftrue,
MUX_uxn_opcodes_h_l2257_c11_0fcd_iffalse,
MUX_uxn_opcodes_h_l2257_c11_0fcd_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2259_c30_c577
sp_relative_shift_uxn_opcodes_h_l2259_c30_c577 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_ins,
sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_x,
sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_y,
sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_left,
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_right,
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_cond,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860
result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2267_c31_a069
CONST_SR_8_uxn_opcodes_h_l2267_c31_a069 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2267_c31_a069_x,
CONST_SR_8_uxn_opcodes_h_l2267_c31_a069_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940
BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_left,
BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_right,
BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59
CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output,
 n16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output,
 t16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_return_output,
 tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output,
 n16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_return_output,
 t16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output,
 n16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output,
 t16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output,
 n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output,
 t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output,
 n16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_return_output,
 t16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_return_output,
 n16_MUX_uxn_opcodes_h_l2244_c7_3573_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output,
 n16_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_return_output,
 n16_MUX_uxn_opcodes_h_l2252_c7_026b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_return_output,
 tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output,
 n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_return_output,
 MUX_uxn_opcodes_h_l2257_c11_0fcd_return_output,
 sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_return_output,
 CONST_SR_8_uxn_opcodes_h_l2267_c31_a069_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2226_c3_1c82 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2230_c3_6089 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2229_c7_761b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2235_c3_ed27 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2238_c3_a86e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2244_c7_3573_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_0d06 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2240_c7_407d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2244_c7_3573_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2245_c3_0996 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_026b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2247_c7_85dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2250_c3_8ce7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_026b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2253_c3_0dcf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_5ded : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2257_c11_0fcd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2257_c11_0fcd_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2257_c11_0fcd_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2257_c11_0fcd_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2262_c21_a301_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_b56a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2264_c7_3860_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2267_c31_a069_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2267_c31_a069_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2267_c21_fc48_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_2794_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2269_l2237_l2264_l2232_DUPLICATE_db8a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2232_l2255_DUPLICATE_56ab_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_630f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2252_l2247_l2244_l2240_l2269_l2237_l2264_l2232_l2255_DUPLICATE_17a1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2241_l2256_l2233_l2248_DUPLICATE_1c77_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2220_l2274_DUPLICATE_de06_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2238_c3_a86e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2238_c3_a86e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2250_c3_8ce7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2250_c3_8ce7;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2253_c3_0dcf := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2253_c3_0dcf;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2235_c3_ed27 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2235_c3_ed27;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_0d06 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_0d06;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_5ded := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_5ded;
     VAR_sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2230_c3_6089 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2230_c3_6089;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_b56a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_b56a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2257_c11_0fcd_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2245_c3_0996 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2245_c3_0996;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2226_c3_1c82 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2226_c3_1c82;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2267_c31_a069_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_2794 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_2794_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l2267_c31_a069] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2267_c31_a069_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2267_c31_a069_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2267_c31_a069_return_output := CONST_SR_8_uxn_opcodes_h_l2267_c31_a069_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2255_c11_5b68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_left;
     BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_return_output := BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2264_c7_3860] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2264_c7_3860_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_630f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_630f_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2247_c11_9fa5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2259_c30_c577] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_ins;
     sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_x;
     sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_return_output := sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2244_c11_074b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2232_l2255_DUPLICATE_56ab LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2232_l2255_DUPLICATE_56ab_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2252_c11_a20b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2241_l2256_l2233_l2248_DUPLICATE_1c77 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2241_l2256_l2233_l2248_DUPLICATE_1c77_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2264_c11_fe23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_left;
     BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_return_output := BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2224_c6_43f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2269_c11_d940] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_left;
     BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_return_output := BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2237_c11_898a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2257_c11_c571] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_left;
     BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_return_output := BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2240_c11_703e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2252_l2247_l2244_l2240_l2269_l2237_l2264_l2232_l2255_DUPLICATE_17a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2252_l2247_l2244_l2240_l2269_l2237_l2264_l2232_l2255_DUPLICATE_17a1_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2229_c11_e658] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_left;
     BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_return_output := BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2232_c11_9ef0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2269_l2237_l2264_l2232_DUPLICATE_db8a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2269_l2237_l2264_l2232_DUPLICATE_db8a_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c6_43f5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2229_c7_761b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2229_c7_761b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_e658_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2232_c11_9ef0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_898a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2240_c7_407d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2240_c7_407d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_703e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2244_c7_3573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_074b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2247_c7_85dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_9fa5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_026b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_a20b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_5b68_return_output;
     VAR_MUX_uxn_opcodes_h_l2257_c11_0fcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c571_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_fe23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_d940_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2241_l2256_l2233_l2248_DUPLICATE_1c77_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2241_l2256_l2233_l2248_DUPLICATE_1c77_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2241_l2256_l2233_l2248_DUPLICATE_1c77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2232_l2255_DUPLICATE_56ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2232_l2255_DUPLICATE_56ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2232_l2255_DUPLICATE_56ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2232_l2255_DUPLICATE_56ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2232_l2255_DUPLICATE_56ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2232_l2255_DUPLICATE_56ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2232_l2255_DUPLICATE_56ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2232_l2255_DUPLICATE_56ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2232_l2255_DUPLICATE_56ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2252_l2247_l2244_l2240_l2269_l2237_l2264_l2232_l2255_DUPLICATE_17a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2252_l2247_l2244_l2240_l2269_l2237_l2264_l2232_l2255_DUPLICATE_17a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2252_l2247_l2244_l2240_l2269_l2237_l2264_l2232_l2255_DUPLICATE_17a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2252_l2247_l2244_l2240_l2269_l2237_l2264_l2232_l2255_DUPLICATE_17a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2252_l2247_l2244_l2240_l2269_l2237_l2264_l2232_l2255_DUPLICATE_17a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2252_l2247_l2244_l2240_l2269_l2237_l2264_l2232_l2255_DUPLICATE_17a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2252_l2247_l2244_l2240_l2269_l2237_l2264_l2232_l2255_DUPLICATE_17a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2252_l2247_l2244_l2240_l2269_l2237_l2264_l2232_l2255_DUPLICATE_17a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2252_l2247_l2244_l2240_l2269_l2237_l2264_l2232_l2255_DUPLICATE_17a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2229_l2252_l2247_l2244_l2240_l2269_l2237_l2264_l2232_l2255_DUPLICATE_17a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_630f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_630f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_630f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_630f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_630f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_630f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_630f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_630f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_630f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2269_l2237_l2264_l2232_DUPLICATE_db8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2269_l2237_l2264_l2232_DUPLICATE_db8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2269_l2237_l2264_l2232_DUPLICATE_db8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2269_l2237_l2264_l2232_DUPLICATE_db8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2269_l2237_l2264_l2232_DUPLICATE_db8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2269_l2237_l2264_l2232_DUPLICATE_db8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2269_l2237_l2264_l2232_DUPLICATE_db8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2269_l2237_l2264_l2232_DUPLICATE_db8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2269_l2237_l2264_l2232_DUPLICATE_db8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2269_l2237_l2264_l2232_DUPLICATE_db8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_2794_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_2794_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_2794_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_2794_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_2794_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_2794_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_2794_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_2794_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2229_l2252_l2224_l2247_l2244_l2240_l2237_l2264_l2232_DUPLICATE_2794_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2264_c7_3860_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2259_c30_c577_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2264_c7_3860] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2256_c3_d464] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_left;
     BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_return_output := BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2241_c3_c5bd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_left;
     BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_return_output := BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2264_c7_3860] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2267_c21_fc48] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2267_c21_fc48_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2267_c31_a069_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2269_c7_6f60] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2255_c7_eeb6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2269_c7_6f60] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2241_c3_c5bd_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_d464_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2267_c21_fc48_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2234_DUPLICATE_3d59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_6f60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2264_c7_3860_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_6f60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3860_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2264_c7_3860] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_return_output := result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2255_c7_eeb6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2264_c7_3860] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_return_output;

     -- t16_MUX[uxn_opcodes_h_l2240_c7_407d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2240_c7_407d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2240_c7_407d_cond;
     t16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue;
     t16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output := t16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2257_c26_9329] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_left;
     BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_return_output := BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2264_c7_3860] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2255_c7_eeb6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2255_c7_eeb6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond;
     n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue;
     n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output := n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c7_026b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2257_c11_0fcd_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2257_c26_9329_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3860_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3860_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_026b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3860_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;
     -- t16_MUX[uxn_opcodes_h_l2237_c7_b8ee] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond <= VAR_t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond;
     t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue;
     t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output := t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2252_c7_026b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2247_c7_85dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output;

     -- MUX[uxn_opcodes_h_l2257_c11_0fcd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2257_c11_0fcd_cond <= VAR_MUX_uxn_opcodes_h_l2257_c11_0fcd_cond;
     MUX_uxn_opcodes_h_l2257_c11_0fcd_iftrue <= VAR_MUX_uxn_opcodes_h_l2257_c11_0fcd_iftrue;
     MUX_uxn_opcodes_h_l2257_c11_0fcd_iffalse <= VAR_MUX_uxn_opcodes_h_l2257_c11_0fcd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2257_c11_0fcd_return_output := MUX_uxn_opcodes_h_l2257_c11_0fcd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c7_026b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2252_c7_026b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2252_c7_026b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2252_c7_026b_cond;
     n16_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue;
     n16_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_026b_return_output := n16_MUX_uxn_opcodes_h_l2252_c7_026b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2255_c7_eeb6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2255_c7_eeb6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue := VAR_MUX_uxn_opcodes_h_l2257_c11_0fcd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2252_c7_026b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_026b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_026b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2247_c7_85dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output;

     -- n16_MUX[uxn_opcodes_h_l2247_c7_85dc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2247_c7_85dc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2247_c7_85dc_cond;
     n16_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue;
     n16_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output := n16_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c7_026b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c7_026b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2244_c7_3573] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_return_output;

     -- t16_MUX[uxn_opcodes_h_l2232_c7_04b6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond;
     t16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue;
     t16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output := t16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2247_c7_85dc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2262_c21_a301] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2262_c21_a301_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2257_c11_0fcd_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l2255_c7_eeb6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond;
     tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output := tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2262_c21_a301_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_026b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_026b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_3573_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2244_c7_3573] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2244_c7_3573] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2247_c7_85dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2240_c7_407d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2255_c7_eeb6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2247_c7_85dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output;

     -- t16_MUX[uxn_opcodes_h_l2229_c7_761b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2229_c7_761b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2229_c7_761b_cond;
     t16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue;
     t16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output := t16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2244_c7_3573] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2244_c7_3573_cond <= VAR_n16_MUX_uxn_opcodes_h_l2244_c7_3573_cond;
     n16_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue;
     n16_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2244_c7_3573_return_output := n16_MUX_uxn_opcodes_h_l2244_c7_3573_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2252_c7_026b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_cond;
     tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_return_output := tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2244_c7_3573_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_3573_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_3573_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2255_c7_eeb6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_026b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2252_c7_026b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2247_c7_85dc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_cond;
     tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output := tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2240_c7_407d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2240_c7_407d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2240_c7_407d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2240_c7_407d_cond;
     n16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue;
     n16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output := n16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2244_c7_3573] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2237_c7_b8ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2244_c7_3573] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_return_output;

     -- t16_MUX[uxn_opcodes_h_l2224_c2_d27d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond;
     t16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue;
     t16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output := t16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2240_c7_407d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_3573_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_3573_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_026b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2247_c7_85dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output;

     -- n16_MUX[uxn_opcodes_h_l2237_c7_b8ee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond <= VAR_n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond;
     n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue;
     n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output := n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2240_c7_407d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2237_c7_b8ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2240_c7_407d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2237_c7_b8ee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2244_c7_3573] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_cond;
     tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_return_output := tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2232_c7_04b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2247_c7_85dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_3573_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2237_c7_b8ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2232_c7_04b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2240_c7_407d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_cond;
     tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output := tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2232_c7_04b6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond;
     n16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue;
     n16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output := n16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2237_c7_b8ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2232_c7_04b6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2229_c7_761b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2244_c7_3573] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_return_output := result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_3573_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2237_c7_b8ee] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond;
     tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output := tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2232_c7_04b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2240_c7_407d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2224_c2_d27d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2229_c7_761b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2232_c7_04b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2229_c7_761b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2229_c7_761b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2229_c7_761b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2229_c7_761b_cond;
     n16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue;
     n16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output := n16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_407d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2237_c7_b8ee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output := result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;

     -- n16_MUX[uxn_opcodes_h_l2224_c2_d27d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond;
     n16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue;
     n16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output := n16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2232_c7_04b6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_cond;
     tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output := tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2229_c7_761b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2229_c7_761b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2224_c2_d27d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2224_c2_d27d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_b8ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2229_c7_761b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_cond;
     tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output := tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2224_c2_d27d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2232_c7_04b6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2224_c2_d27d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2232_c7_04b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2229_c7_761b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2224_c2_d27d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_cond;
     tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output := tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output;

     -- Submodule level 13
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_761b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2224_c2_d27d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output;

     -- Submodule level 14
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2220_l2274_DUPLICATE_de06 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2220_l2274_DUPLICATE_de06_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2224_c2_d27d_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2220_l2274_DUPLICATE_de06_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2220_l2274_DUPLICATE_de06_return_output;
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
