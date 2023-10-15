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
-- Submodules: 114
entity div2_0CLK_33db19bd is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_33db19bd;
architecture arch of div2_0CLK_33db19bd is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2274_c6_ce43]
signal BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2274_c2_d65c]
signal t16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2274_c2_d65c]
signal tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2274_c2_d65c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2274_c2_d65c]
signal result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2274_c2_d65c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2274_c2_d65c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2274_c2_d65c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2274_c2_d65c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2274_c2_d65c]
signal n16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2279_c11_ac8a]
signal BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2279_c7_595a]
signal t16_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2279_c7_595a]
signal tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2279_c7_595a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2279_c7_595a]
signal result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2279_c7_595a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2279_c7_595a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2279_c7_595a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2279_c7_595a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2279_c7_595a]
signal n16_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2282_c11_2f99]
signal BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2282_c7_7ed2]
signal t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2282_c7_7ed2]
signal tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2282_c7_7ed2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2282_c7_7ed2]
signal result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2282_c7_7ed2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2282_c7_7ed2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2282_c7_7ed2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2282_c7_7ed2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2282_c7_7ed2]
signal n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2287_c11_a436]
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2287_c7_4d66]
signal t16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2287_c7_4d66]
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2287_c7_4d66]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2287_c7_4d66]
signal result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2287_c7_4d66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2287_c7_4d66]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2287_c7_4d66]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2287_c7_4d66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2287_c7_4d66]
signal n16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2290_c11_eced]
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2290_c7_2c2f]
signal t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2290_c7_2c2f]
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2290_c7_2c2f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2290_c7_2c2f]
signal result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2290_c7_2c2f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2290_c7_2c2f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2290_c7_2c2f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2290_c7_2c2f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2290_c7_2c2f]
signal n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2291_c3_2708]
signal BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2294_c11_0195]
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2294_c7_434f]
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2294_c7_434f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2294_c7_434f]
signal result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2294_c7_434f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2294_c7_434f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2294_c7_434f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2294_c7_434f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2294_c7_434f]
signal n16_MUX_uxn_opcodes_h_l2294_c7_434f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2294_c7_434f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2297_c11_7b3d]
signal BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2297_c7_a463]
signal tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2297_c7_a463]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2297_c7_a463]
signal result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2297_c7_a463]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2297_c7_a463]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2297_c7_a463]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2297_c7_a463]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2297_c7_a463]
signal n16_MUX_uxn_opcodes_h_l2297_c7_a463_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2297_c7_a463_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2302_c11_d7e2]
signal BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2302_c7_a0f2]
signal tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2302_c7_a0f2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2302_c7_a0f2]
signal result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2302_c7_a0f2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2302_c7_a0f2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2302_c7_a0f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2302_c7_a0f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2302_c7_a0f2]
signal n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2305_c11_819d]
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2305_c7_8522]
signal tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2305_c7_8522]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2305_c7_8522]
signal result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2305_c7_8522]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2305_c7_8522]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2305_c7_8522]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2305_c7_8522]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2305_c7_8522]
signal n16_MUX_uxn_opcodes_h_l2305_c7_8522_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2305_c7_8522_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2306_c3_5fb5]
signal BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2307_c11_346e]
signal BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2307_c26_c643]
signal BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2307_c11_26bc]
signal MUX_uxn_opcodes_h_l2307_c11_26bc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2307_c11_26bc_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2307_c11_26bc_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2307_c11_26bc_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2309_c32_7157]
signal BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2309_c32_3991]
signal BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2309_c32_5de9]
signal MUX_uxn_opcodes_h_l2309_c32_5de9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2309_c32_5de9_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2309_c32_5de9_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2309_c32_5de9_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2311_c11_04af]
signal BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2311_c7_f7b3]
signal result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2311_c7_f7b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2311_c7_f7b3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2311_c7_f7b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2311_c7_f7b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2317_c11_0c04]
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2317_c7_1343]
signal result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2317_c7_1343]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2317_c7_1343]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2317_c7_1343]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2319_c34_215f]
signal CONST_SR_8_uxn_opcodes_h_l2319_c34_215f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2319_c34_215f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2321_c11_9250]
signal BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2321_c7_8728]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2321_c7_8728]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43
BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_left,
BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_right,
BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_return_output);

-- t16_MUX_uxn_opcodes_h_l2274_c2_d65c
t16_MUX_uxn_opcodes_h_l2274_c2_d65c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond,
t16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue,
t16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse,
t16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c
tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond,
tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c
result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c
result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output);

-- n16_MUX_uxn_opcodes_h_l2274_c2_d65c
n16_MUX_uxn_opcodes_h_l2274_c2_d65c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond,
n16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue,
n16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse,
n16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a
BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_left,
BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_right,
BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_return_output);

-- t16_MUX_uxn_opcodes_h_l2279_c7_595a
t16_MUX_uxn_opcodes_h_l2279_c7_595a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2279_c7_595a_cond,
t16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue,
t16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse,
t16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2279_c7_595a
tmp16_MUX_uxn_opcodes_h_l2279_c7_595a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_cond,
tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a
result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a
result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a
result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a
result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_return_output);

-- n16_MUX_uxn_opcodes_h_l2279_c7_595a
n16_MUX_uxn_opcodes_h_l2279_c7_595a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2279_c7_595a_cond,
n16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue,
n16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse,
n16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99
BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_left,
BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_right,
BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_return_output);

-- t16_MUX_uxn_opcodes_h_l2282_c7_7ed2
t16_MUX_uxn_opcodes_h_l2282_c7_7ed2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond,
t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue,
t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse,
t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2
tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond,
tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2
result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2
result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2
result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output);

-- n16_MUX_uxn_opcodes_h_l2282_c7_7ed2
n16_MUX_uxn_opcodes_h_l2282_c7_7ed2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond,
n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue,
n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse,
n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_left,
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_right,
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_return_output);

-- t16_MUX_uxn_opcodes_h_l2287_c7_4d66
t16_MUX_uxn_opcodes_h_l2287_c7_4d66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond,
t16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue,
t16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse,
t16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66
tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond,
tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue,
tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse,
tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66
result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_cond,
result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output);

-- n16_MUX_uxn_opcodes_h_l2287_c7_4d66
n16_MUX_uxn_opcodes_h_l2287_c7_4d66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond,
n16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue,
n16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse,
n16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_left,
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_right,
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_return_output);

-- t16_MUX_uxn_opcodes_h_l2290_c7_2c2f
t16_MUX_uxn_opcodes_h_l2290_c7_2c2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond,
t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue,
t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse,
t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f
tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond,
tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f
result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output);

-- n16_MUX_uxn_opcodes_h_l2290_c7_2c2f
n16_MUX_uxn_opcodes_h_l2290_c7_2c2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond,
n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue,
n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse,
n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708
BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_left,
BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_right,
BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_left,
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_right,
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2294_c7_434f
tmp16_MUX_uxn_opcodes_h_l2294_c7_434f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_cond,
tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f
result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_return_output);

-- n16_MUX_uxn_opcodes_h_l2294_c7_434f
n16_MUX_uxn_opcodes_h_l2294_c7_434f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2294_c7_434f_cond,
n16_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue,
n16_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse,
n16_MUX_uxn_opcodes_h_l2294_c7_434f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d
BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_left,
BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_right,
BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2297_c7_a463
tmp16_MUX_uxn_opcodes_h_l2297_c7_a463 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_cond,
tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue,
tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse,
tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463
result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_cond,
result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_return_output);

-- n16_MUX_uxn_opcodes_h_l2297_c7_a463
n16_MUX_uxn_opcodes_h_l2297_c7_a463 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2297_c7_a463_cond,
n16_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue,
n16_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse,
n16_MUX_uxn_opcodes_h_l2297_c7_a463_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_left,
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_right,
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2
tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond,
tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2
result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output);

-- n16_MUX_uxn_opcodes_h_l2302_c7_a0f2
n16_MUX_uxn_opcodes_h_l2302_c7_a0f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond,
n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue,
n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse,
n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_left,
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_right,
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2305_c7_8522
tmp16_MUX_uxn_opcodes_h_l2305_c7_8522 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_cond,
tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue,
tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse,
tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_cond,
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_return_output);

-- n16_MUX_uxn_opcodes_h_l2305_c7_8522
n16_MUX_uxn_opcodes_h_l2305_c7_8522 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2305_c7_8522_cond,
n16_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue,
n16_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse,
n16_MUX_uxn_opcodes_h_l2305_c7_8522_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5
BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_left,
BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_right,
BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e
BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_left,
BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_right,
BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643
BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_left,
BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_right,
BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_return_output);

-- MUX_uxn_opcodes_h_l2307_c11_26bc
MUX_uxn_opcodes_h_l2307_c11_26bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2307_c11_26bc_cond,
MUX_uxn_opcodes_h_l2307_c11_26bc_iftrue,
MUX_uxn_opcodes_h_l2307_c11_26bc_iffalse,
MUX_uxn_opcodes_h_l2307_c11_26bc_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157
BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_left,
BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_right,
BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991
BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_left,
BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_right,
BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_return_output);

-- MUX_uxn_opcodes_h_l2309_c32_5de9
MUX_uxn_opcodes_h_l2309_c32_5de9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2309_c32_5de9_cond,
MUX_uxn_opcodes_h_l2309_c32_5de9_iftrue,
MUX_uxn_opcodes_h_l2309_c32_5de9_iffalse,
MUX_uxn_opcodes_h_l2309_c32_5de9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af
BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_left,
BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_right,
BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3
result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_left,
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_right,
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343
result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_cond,
result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2319_c34_215f
CONST_SR_8_uxn_opcodes_h_l2319_c34_215f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2319_c34_215f_x,
CONST_SR_8_uxn_opcodes_h_l2319_c34_215f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250
BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_left,
BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_right,
BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728
result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728
result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7
CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_return_output,
 t16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output,
 n16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_return_output,
 t16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_return_output,
 n16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_return_output,
 t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output,
 n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_return_output,
 t16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output,
 tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output,
 n16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_return_output,
 t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output,
 n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_return_output,
 tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_return_output,
 n16_MUX_uxn_opcodes_h_l2294_c7_434f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_return_output,
 n16_MUX_uxn_opcodes_h_l2297_c7_a463_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output,
 n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_return_output,
 n16_MUX_uxn_opcodes_h_l2305_c7_8522_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_return_output,
 MUX_uxn_opcodes_h_l2307_c11_26bc_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_return_output,
 MUX_uxn_opcodes_h_l2309_c32_5de9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_return_output,
 CONST_SR_8_uxn_opcodes_h_l2319_c34_215f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2276_c3_1a20 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_43d3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2279_c7_595a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_e39f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_8170 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2292_c3_fa44 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2294_c7_434f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_9215 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2297_c7_a463_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2294_c7_434f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2300_c3_32e7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2297_c7_a463_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_68f0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2305_c7_8522_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2305_c7_8522_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2307_c11_26bc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2307_c11_26bc_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2307_c11_26bc_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2307_c11_26bc_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2309_c32_5de9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2309_c32_5de9_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2309_c32_5de9_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2309_c32_5de9_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_8e58 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c24_a2ab_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2318_c3_ec0a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2319_c34_215f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2319_c34_215f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2319_c24_a7e1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2282_l2305_DUPLICATE_0443_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2317_l2287_l2282_l2305_DUPLICATE_0803_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2311_l2282_DUPLICATE_81b5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2321_l2290_l2317_l2287_l2282_l2305_DUPLICATE_78bc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2279_l2302_l2297_l2294_l2321_l2290_l2317_l2287_l2311_l2282_l2305_DUPLICATE_29d6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2283_l2306_l2298_l2291_DUPLICATE_876a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2317_l2305_DUPLICATE_0436_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2326_l2270_DUPLICATE_0229_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_43d3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_43d3;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_9215 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_9215;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2318_c3_ec0a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2318_c3_ec0a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_e39f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_e39f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2309_c32_5de9_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2276_c3_1a20 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2276_c3_1a20;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2292_c3_fa44 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2292_c3_fa44;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2300_c3_32e7 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2300_c3_32e7;
     VAR_MUX_uxn_opcodes_h_l2307_c11_26bc_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_68f0 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_68f0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_right := to_unsigned(8, 4);
     VAR_MUX_uxn_opcodes_h_l2309_c32_5de9_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_8e58 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_8e58;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_8170 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_8170;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_right := to_unsigned(0, 1);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2319_c34_215f_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2283_l2306_l2298_l2291_DUPLICATE_876a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2283_l2306_l2298_l2291_DUPLICATE_876a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2317_l2287_l2282_l2305_DUPLICATE_0803 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2317_l2287_l2282_l2305_DUPLICATE_0803_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2307_c11_346e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2319_c34_215f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2319_c34_215f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2319_c34_215f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2319_c34_215f_return_output := CONST_SR_8_uxn_opcodes_h_l2319_c34_215f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2311_c11_04af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2302_c11_d7e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2321_l2290_l2317_l2287_l2282_l2305_DUPLICATE_78bc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2321_l2290_l2317_l2287_l2282_l2305_DUPLICATE_78bc_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2297_c11_7b3d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2279_l2302_l2297_l2294_l2321_l2290_l2317_l2287_l2311_l2282_l2305_DUPLICATE_29d6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2279_l2302_l2297_l2294_l2321_l2290_l2317_l2287_l2311_l2282_l2305_DUPLICATE_29d6_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2282_l2305_DUPLICATE_0443 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2282_l2305_DUPLICATE_0443_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2317_c11_0c04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_left;
     BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_return_output := BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2274_c6_ce43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_left;
     BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_return_output := BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2290_c11_eced] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_left;
     BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_return_output := BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2294_c11_0195] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_left;
     BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_return_output := BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2315_c24_a2ab] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c24_a2ab_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2311_l2282_DUPLICATE_81b5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2311_l2282_DUPLICATE_81b5_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2321_c11_9250] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_left;
     BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_return_output := BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2309_c32_7157] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_left;
     BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_return_output := BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2305_c11_819d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2287_c11_a436] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_left;
     BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_return_output := BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2279_c11_ac8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2282_c11_2f99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_left;
     BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_return_output := BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2317_l2305_DUPLICATE_0436 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2317_l2305_DUPLICATE_0436_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_7157_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_ce43_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2279_c7_595a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2279_c7_595a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_ac8a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_2f99_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_a436_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_eced_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2294_c7_434f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_0195_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2297_c7_a463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_7b3d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_d7e2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2305_c7_8522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_819d_return_output;
     VAR_MUX_uxn_opcodes_h_l2307_c11_26bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_346e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_04af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_0c04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_9250_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2283_l2306_l2298_l2291_DUPLICATE_876a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2283_l2306_l2298_l2291_DUPLICATE_876a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2283_l2306_l2298_l2291_DUPLICATE_876a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c24_a2ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2282_l2305_DUPLICATE_0443_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2282_l2305_DUPLICATE_0443_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2282_l2305_DUPLICATE_0443_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2282_l2305_DUPLICATE_0443_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2282_l2305_DUPLICATE_0443_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2282_l2305_DUPLICATE_0443_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2282_l2305_DUPLICATE_0443_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2282_l2305_DUPLICATE_0443_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2282_l2305_DUPLICATE_0443_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2279_l2302_l2297_l2294_l2321_l2290_l2317_l2287_l2311_l2282_l2305_DUPLICATE_29d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2279_l2302_l2297_l2294_l2321_l2290_l2317_l2287_l2311_l2282_l2305_DUPLICATE_29d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2279_l2302_l2297_l2294_l2321_l2290_l2317_l2287_l2311_l2282_l2305_DUPLICATE_29d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2279_l2302_l2297_l2294_l2321_l2290_l2317_l2287_l2311_l2282_l2305_DUPLICATE_29d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2279_l2302_l2297_l2294_l2321_l2290_l2317_l2287_l2311_l2282_l2305_DUPLICATE_29d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2279_l2302_l2297_l2294_l2321_l2290_l2317_l2287_l2311_l2282_l2305_DUPLICATE_29d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2279_l2302_l2297_l2294_l2321_l2290_l2317_l2287_l2311_l2282_l2305_DUPLICATE_29d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2279_l2302_l2297_l2294_l2321_l2290_l2317_l2287_l2311_l2282_l2305_DUPLICATE_29d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2279_l2302_l2297_l2294_l2321_l2290_l2317_l2287_l2311_l2282_l2305_DUPLICATE_29d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2279_l2302_l2297_l2294_l2321_l2290_l2317_l2287_l2311_l2282_l2305_DUPLICATE_29d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2279_l2302_l2297_l2294_l2321_l2290_l2317_l2287_l2311_l2282_l2305_DUPLICATE_29d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2311_l2282_DUPLICATE_81b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2311_l2282_DUPLICATE_81b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2311_l2282_DUPLICATE_81b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2311_l2282_DUPLICATE_81b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2311_l2282_DUPLICATE_81b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2311_l2282_DUPLICATE_81b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2311_l2282_DUPLICATE_81b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2311_l2282_DUPLICATE_81b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2287_l2311_l2282_DUPLICATE_81b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2321_l2290_l2317_l2287_l2282_l2305_DUPLICATE_78bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2321_l2290_l2317_l2287_l2282_l2305_DUPLICATE_78bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2321_l2290_l2317_l2287_l2282_l2305_DUPLICATE_78bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2321_l2290_l2317_l2287_l2282_l2305_DUPLICATE_78bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2321_l2290_l2317_l2287_l2282_l2305_DUPLICATE_78bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2321_l2290_l2317_l2287_l2282_l2305_DUPLICATE_78bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2321_l2290_l2317_l2287_l2282_l2305_DUPLICATE_78bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2321_l2290_l2317_l2287_l2282_l2305_DUPLICATE_78bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2321_l2290_l2317_l2287_l2282_l2305_DUPLICATE_78bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2321_l2290_l2317_l2287_l2282_l2305_DUPLICATE_78bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2321_l2290_l2317_l2287_l2282_l2305_DUPLICATE_78bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2317_l2305_DUPLICATE_0436_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2317_l2305_DUPLICATE_0436_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2317_l2287_l2282_l2305_DUPLICATE_0803_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2317_l2287_l2282_l2305_DUPLICATE_0803_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2317_l2287_l2282_l2305_DUPLICATE_0803_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2317_l2287_l2282_l2305_DUPLICATE_0803_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2317_l2287_l2282_l2305_DUPLICATE_0803_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2317_l2287_l2282_l2305_DUPLICATE_0803_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2317_l2287_l2282_l2305_DUPLICATE_0803_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2317_l2287_l2282_l2305_DUPLICATE_0803_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2317_l2287_l2282_l2305_DUPLICATE_0803_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2279_l2302_l2274_l2297_l2294_l2290_l2317_l2287_l2282_l2305_DUPLICATE_0803_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2321_c7_8728] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2309_c32_3991] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_left;
     BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_return_output := BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2317_c7_1343] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2306_c3_5fb5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_left;
     BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_return_output := BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2291_c3_2708] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_left;
     BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_return_output := BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2319_c24_a7e1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2319_c24_a7e1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2319_c34_215f_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2321_c7_8728] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2311_c7_f7b3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2309_c32_5de9_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_3991_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_2708_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_5fb5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2319_c24_a7e1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_9de7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_8728_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_8728_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_1343_return_output;
     -- BIN_OP_DIV[uxn_opcodes_h_l2307_c26_c643] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_left;
     BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_return_output := BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2317_c7_1343] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_return_output;

     -- n16_MUX[uxn_opcodes_h_l2305_c7_8522] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2305_c7_8522_cond <= VAR_n16_MUX_uxn_opcodes_h_l2305_c7_8522_cond;
     n16_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue;
     n16_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2305_c7_8522_return_output := n16_MUX_uxn_opcodes_h_l2305_c7_8522_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2311_c7_f7b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2305_c7_8522] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_return_output;

     -- MUX[uxn_opcodes_h_l2309_c32_5de9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2309_c32_5de9_cond <= VAR_MUX_uxn_opcodes_h_l2309_c32_5de9_cond;
     MUX_uxn_opcodes_h_l2309_c32_5de9_iftrue <= VAR_MUX_uxn_opcodes_h_l2309_c32_5de9_iftrue;
     MUX_uxn_opcodes_h_l2309_c32_5de9_iffalse <= VAR_MUX_uxn_opcodes_h_l2309_c32_5de9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2309_c32_5de9_return_output := MUX_uxn_opcodes_h_l2309_c32_5de9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2317_c7_1343] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_return_output := result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2317_c7_1343] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_return_output;

     -- t16_MUX[uxn_opcodes_h_l2290_c7_2c2f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond;
     t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue;
     t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output := t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2307_c11_26bc_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_c643_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue := VAR_MUX_uxn_opcodes_h_l2309_c32_5de9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2305_c7_8522_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_1343_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8522_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_1343_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_1343_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2311_c7_f7b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2311_c7_f7b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2305_c7_8522] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2311_c7_f7b3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2302_c7_a0f2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond;
     n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue;
     n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output := n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2305_c7_8522] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2302_c7_a0f2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output;

     -- MUX[uxn_opcodes_h_l2307_c11_26bc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2307_c11_26bc_cond <= VAR_MUX_uxn_opcodes_h_l2307_c11_26bc_cond;
     MUX_uxn_opcodes_h_l2307_c11_26bc_iftrue <= VAR_MUX_uxn_opcodes_h_l2307_c11_26bc_iftrue;
     MUX_uxn_opcodes_h_l2307_c11_26bc_iffalse <= VAR_MUX_uxn_opcodes_h_l2307_c11_26bc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2307_c11_26bc_return_output := MUX_uxn_opcodes_h_l2307_c11_26bc_return_output;

     -- t16_MUX[uxn_opcodes_h_l2287_c7_4d66] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond <= VAR_t16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond;
     t16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue;
     t16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output := t16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue := VAR_MUX_uxn_opcodes_h_l2307_c11_26bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8522_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8522_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_f7b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2302_c7_a0f2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2305_c7_8522] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_return_output := result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2305_c7_8522] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2302_c7_a0f2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2305_c7_8522] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2297_c7_a463] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_return_output;

     -- t16_MUX[uxn_opcodes_h_l2282_c7_7ed2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond;
     t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue;
     t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output := t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2305_c7_8522] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_cond;
     tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_return_output := tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_return_output;

     -- n16_MUX[uxn_opcodes_h_l2297_c7_a463] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2297_c7_a463_cond <= VAR_n16_MUX_uxn_opcodes_h_l2297_c7_a463_cond;
     n16_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue;
     n16_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2297_c7_a463_return_output := n16_MUX_uxn_opcodes_h_l2297_c7_a463_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2297_c7_a463_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8522_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_a463_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8522_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8522_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_8522_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2297_c7_a463] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2294_c7_434f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2279_c7_595a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2279_c7_595a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2279_c7_595a_cond;
     t16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue;
     t16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output := t16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2302_c7_a0f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2302_c7_a0f2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2294_c7_434f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2294_c7_434f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2294_c7_434f_cond;
     n16_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue;
     n16_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2294_c7_434f_return_output := n16_MUX_uxn_opcodes_h_l2294_c7_434f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2302_c7_a0f2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond;
     tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output := tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2297_c7_a463] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2302_c7_a0f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2294_c7_434f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_434f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_a463_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_a463_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_a0f2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2294_c7_434f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2297_c7_a463] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_return_output;

     -- n16_MUX[uxn_opcodes_h_l2290_c7_2c2f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond;
     n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue;
     n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output := n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2297_c7_a463] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2297_c7_a463] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_cond;
     tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_return_output := tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2294_c7_434f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2290_c7_2c2f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2274_c2_d65c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond;
     t16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue;
     t16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output := t16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2297_c7_a463] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_return_output := result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_a463_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_a463_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_434f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_434f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_a463_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_a463_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2294_c7_434f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2290_c7_2c2f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2290_c7_2c2f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2287_c7_4d66] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2294_c7_434f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_cond;
     tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_return_output := tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2287_c7_4d66] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond <= VAR_n16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond;
     n16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue;
     n16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output := n16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2294_c7_434f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2294_c7_434f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_434f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_434f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_434f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_434f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2290_c7_2c2f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2282_c7_7ed2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2282_c7_7ed2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond;
     n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue;
     n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output := n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2290_c7_2c2f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond;
     tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output := tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2287_c7_4d66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2290_c7_2c2f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2290_c7_2c2f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2287_c7_4d66] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_2c2f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2287_c7_4d66] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output := result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2282_c7_7ed2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2287_c7_4d66] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;

     -- n16_MUX[uxn_opcodes_h_l2279_c7_595a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2279_c7_595a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2279_c7_595a_cond;
     n16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue;
     n16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output := n16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2282_c7_7ed2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2287_c7_4d66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2279_c7_595a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2287_c7_4d66] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_cond;
     tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output := tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_4d66_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2282_c7_7ed2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2279_c7_595a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2279_c7_595a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2274_c2_d65c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond;
     n16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue;
     n16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output := n16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2282_c7_7ed2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2282_c7_7ed2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond;
     tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output := tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2274_c2_d65c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2282_c7_7ed2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_7ed2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2274_c2_d65c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2279_c7_595a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_cond;
     tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output := tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2279_c7_595a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2274_c2_d65c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2279_c7_595a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2279_c7_595a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_595a_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2274_c2_d65c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_cond;
     tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output := tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2274_c2_d65c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2274_c2_d65c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2274_c2_d65c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output;

     -- Submodule level 13
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2326_l2270_DUPLICATE_0229 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2326_l2270_DUPLICATE_0229_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_d65c_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2326_l2270_DUPLICATE_0229_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2326_l2270_DUPLICATE_0229_return_output;
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
