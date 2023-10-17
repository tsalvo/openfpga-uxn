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
entity div2_0CLK_db5cbd9a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_db5cbd9a;
architecture arch of div2_0CLK_db5cbd9a is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2221_c6_cf36]
signal BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2221_c1_e1f1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2221_c2_63ed]
signal n16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2221_c2_63ed]
signal tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2221_c2_63ed]
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2221_c2_63ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2221_c2_63ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2221_c2_63ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2221_c2_63ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2221_c2_63ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2221_c2_63ed]
signal t16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2222_c3_c3dd[uxn_opcodes_h_l2222_c3_c3dd]
signal printf_uxn_opcodes_h_l2222_c3_c3dd_uxn_opcodes_h_l2222_c3_c3dd_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2226_c11_07c1]
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2226_c7_ff54]
signal n16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2226_c7_ff54]
signal tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2226_c7_ff54]
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2226_c7_ff54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2226_c7_ff54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2226_c7_ff54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2226_c7_ff54]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2226_c7_ff54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2226_c7_ff54]
signal t16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2229_c11_204f]
signal BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2229_c7_59dc]
signal n16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2229_c7_59dc]
signal tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2229_c7_59dc]
signal result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2229_c7_59dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2229_c7_59dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2229_c7_59dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2229_c7_59dc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2229_c7_59dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2229_c7_59dc]
signal t16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2234_c11_43bf]
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2234_c7_7e5a]
signal n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2234_c7_7e5a]
signal tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2234_c7_7e5a]
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2234_c7_7e5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2234_c7_7e5a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2234_c7_7e5a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2234_c7_7e5a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2234_c7_7e5a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2234_c7_7e5a]
signal t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2237_c11_b9bf]
signal BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2237_c7_e48e]
signal n16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2237_c7_e48e]
signal tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2237_c7_e48e]
signal result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2237_c7_e48e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2237_c7_e48e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2237_c7_e48e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2237_c7_e48e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2237_c7_e48e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2237_c7_e48e]
signal t16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2238_c3_2e4f]
signal BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2241_c11_1d9c]
signal BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2241_c7_3620]
signal n16_MUX_uxn_opcodes_h_l2241_c7_3620_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2241_c7_3620_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2241_c7_3620]
signal tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2241_c7_3620]
signal result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2241_c7_3620]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2241_c7_3620]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2241_c7_3620]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2241_c7_3620]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2241_c7_3620]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2244_c11_ef7a]
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2244_c7_52bd]
signal n16_MUX_uxn_opcodes_h_l2244_c7_52bd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2244_c7_52bd]
signal tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2244_c7_52bd]
signal result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2244_c7_52bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2244_c7_52bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2244_c7_52bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2244_c7_52bd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2244_c7_52bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2249_c11_b189]
signal BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2249_c7_b172]
signal n16_MUX_uxn_opcodes_h_l2249_c7_b172_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2249_c7_b172_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2249_c7_b172]
signal tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2249_c7_b172]
signal result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2249_c7_b172]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2249_c7_b172]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2249_c7_b172]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2249_c7_b172]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2249_c7_b172]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2252_c11_905b]
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2252_c7_58f4]
signal n16_MUX_uxn_opcodes_h_l2252_c7_58f4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2252_c7_58f4]
signal tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2252_c7_58f4]
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c7_58f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c7_58f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c7_58f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2252_c7_58f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c7_58f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2253_c3_6562]
signal BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2254_c11_6f88]
signal BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2254_c26_c502]
signal BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2254_c11_983e]
signal MUX_uxn_opcodes_h_l2254_c11_983e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2254_c11_983e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2254_c11_983e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2254_c11_983e_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2256_c30_ef5b]
signal sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2261_c11_27a8]
signal BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2261_c7_e498]
signal result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2261_c7_e498]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2261_c7_e498]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2261_c7_e498]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2261_c7_e498]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2264_c31_ffc2]
signal CONST_SR_8_uxn_opcodes_h_l2264_c31_ffc2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2264_c31_ffc2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2266_c11_fa37]
signal BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2266_c7_2637]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2266_c7_2637]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_25e8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36
BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_left,
BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_right,
BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_return_output);

-- n16_MUX_uxn_opcodes_h_l2221_c2_63ed
n16_MUX_uxn_opcodes_h_l2221_c2_63ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond,
n16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue,
n16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse,
n16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed
tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond,
tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue,
tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse,
tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed
result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_cond,
result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed
result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output);

-- t16_MUX_uxn_opcodes_h_l2221_c2_63ed
t16_MUX_uxn_opcodes_h_l2221_c2_63ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond,
t16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue,
t16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse,
t16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output);

-- printf_uxn_opcodes_h_l2222_c3_c3dd_uxn_opcodes_h_l2222_c3_c3dd
printf_uxn_opcodes_h_l2222_c3_c3dd_uxn_opcodes_h_l2222_c3_c3dd : entity work.printf_uxn_opcodes_h_l2222_c3_c3dd_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2222_c3_c3dd_uxn_opcodes_h_l2222_c3_c3dd_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_left,
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_right,
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_return_output);

-- n16_MUX_uxn_opcodes_h_l2226_c7_ff54
n16_MUX_uxn_opcodes_h_l2226_c7_ff54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond,
n16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue,
n16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse,
n16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54
tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond,
tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue,
tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse,
tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_cond,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54
result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output);

-- t16_MUX_uxn_opcodes_h_l2226_c7_ff54
t16_MUX_uxn_opcodes_h_l2226_c7_ff54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond,
t16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue,
t16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse,
t16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_left,
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_right,
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_return_output);

-- n16_MUX_uxn_opcodes_h_l2229_c7_59dc
n16_MUX_uxn_opcodes_h_l2229_c7_59dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond,
n16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue,
n16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse,
n16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc
tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond,
tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue,
tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse,
tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc
result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output);

-- t16_MUX_uxn_opcodes_h_l2229_c7_59dc
t16_MUX_uxn_opcodes_h_l2229_c7_59dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond,
t16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue,
t16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse,
t16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_left,
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_right,
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_return_output);

-- n16_MUX_uxn_opcodes_h_l2234_c7_7e5a
n16_MUX_uxn_opcodes_h_l2234_c7_7e5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond,
n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue,
n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse,
n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a
tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond,
tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output);

-- t16_MUX_uxn_opcodes_h_l2234_c7_7e5a
t16_MUX_uxn_opcodes_h_l2234_c7_7e5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond,
t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue,
t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse,
t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf
BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_left,
BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_right,
BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_return_output);

-- n16_MUX_uxn_opcodes_h_l2237_c7_e48e
n16_MUX_uxn_opcodes_h_l2237_c7_e48e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond,
n16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue,
n16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse,
n16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e
tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond,
tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e
result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output);

-- t16_MUX_uxn_opcodes_h_l2237_c7_e48e
t16_MUX_uxn_opcodes_h_l2237_c7_e48e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond,
t16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue,
t16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse,
t16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f
BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_left,
BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_right,
BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c
BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_left,
BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_right,
BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_return_output);

-- n16_MUX_uxn_opcodes_h_l2241_c7_3620
n16_MUX_uxn_opcodes_h_l2241_c7_3620 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2241_c7_3620_cond,
n16_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue,
n16_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse,
n16_MUX_uxn_opcodes_h_l2241_c7_3620_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2241_c7_3620
tmp16_MUX_uxn_opcodes_h_l2241_c7_3620 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_cond,
tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue,
tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse,
tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620
result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_cond,
result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_left,
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_right,
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_return_output);

-- n16_MUX_uxn_opcodes_h_l2244_c7_52bd
n16_MUX_uxn_opcodes_h_l2244_c7_52bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2244_c7_52bd_cond,
n16_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue,
n16_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse,
n16_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd
tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_cond,
tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue,
tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse,
tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd
result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189
BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_left,
BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_right,
BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_return_output);

-- n16_MUX_uxn_opcodes_h_l2249_c7_b172
n16_MUX_uxn_opcodes_h_l2249_c7_b172 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2249_c7_b172_cond,
n16_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue,
n16_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse,
n16_MUX_uxn_opcodes_h_l2249_c7_b172_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2249_c7_b172
tmp16_MUX_uxn_opcodes_h_l2249_c7_b172 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_cond,
tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue,
tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse,
tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172
result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_cond,
result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172
result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172
result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172
result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172
result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_left,
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_right,
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_return_output);

-- n16_MUX_uxn_opcodes_h_l2252_c7_58f4
n16_MUX_uxn_opcodes_h_l2252_c7_58f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2252_c7_58f4_cond,
n16_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue,
n16_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse,
n16_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4
tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_cond,
tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4
result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562
BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_left,
BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_right,
BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88
BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_left,
BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_right,
BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502
BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_left,
BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_right,
BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_return_output);

-- MUX_uxn_opcodes_h_l2254_c11_983e
MUX_uxn_opcodes_h_l2254_c11_983e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2254_c11_983e_cond,
MUX_uxn_opcodes_h_l2254_c11_983e_iftrue,
MUX_uxn_opcodes_h_l2254_c11_983e_iffalse,
MUX_uxn_opcodes_h_l2254_c11_983e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b
sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_ins,
sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_x,
sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_y,
sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8
BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_left,
BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_right,
BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498
result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_cond,
result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498
result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498
result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498
result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2264_c31_ffc2
CONST_SR_8_uxn_opcodes_h_l2264_c31_ffc2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2264_c31_ffc2_x,
CONST_SR_8_uxn_opcodes_h_l2264_c31_ffc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37
BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_left,
BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_right,
BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637
result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637
result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32
CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_return_output,
 n16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output,
 tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output,
 t16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_return_output,
 n16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output,
 tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output,
 t16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_return_output,
 n16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output,
 tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output,
 t16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_return_output,
 n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output,
 t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_return_output,
 n16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output,
 t16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_return_output,
 n16_MUX_uxn_opcodes_h_l2241_c7_3620_return_output,
 tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_return_output,
 n16_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output,
 tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_return_output,
 n16_MUX_uxn_opcodes_h_l2249_c7_b172_return_output,
 tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_return_output,
 n16_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_return_output,
 MUX_uxn_opcodes_h_l2254_c11_983e_return_output,
 sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_return_output,
 CONST_SR_8_uxn_opcodes_h_l2264_c31_ffc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2223_c3_5df7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2222_c3_c3dd_uxn_opcodes_h_l2222_c3_c3dd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2227_c3_c34e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2232_c3_0401 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2235_c3_27ec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2241_c7_3620_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2239_c3_d7ae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2241_c7_3620_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_1207 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2249_c7_b172_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2244_c7_52bd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2247_c3_49d2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2249_c7_b172_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2250_c3_2644 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_58f4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2258_c3_b98e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2254_c11_983e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2254_c11_983e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2254_c11_983e_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2254_c11_983e_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2259_c21_6668_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2263_c3_e1a2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2261_c7_e498_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2264_c31_ffc2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2264_c31_ffc2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2264_c21_7623_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_f23e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2229_l2252_l2226_DUPLICATE_078f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2226_DUPLICATE_fa04_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_9b4d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2249_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_DUPLICATE_5072_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2238_l2253_l2230_l2245_DUPLICATE_4f52_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2217_l2271_DUPLICATE_c632_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2263_c3_e1a2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2263_c3_e1a2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2232_c3_0401 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2232_c3_0401;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2227_c3_c34e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2227_c3_c34e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2250_c3_2644 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2250_c3_2644;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_1207 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_1207;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2223_c3_5df7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2223_c3_5df7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2239_c3_d7ae := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2239_c3_d7ae;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2247_c3_49d2 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2247_c3_49d2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2258_c3_b98e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2258_c3_b98e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2235_c3_27ec := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2235_c3_27ec;
     VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_right := to_unsigned(9, 4);
     VAR_MUX_uxn_opcodes_h_l2254_c11_983e_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2264_c31_ffc2_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse := tmp16;
     -- sp_relative_shift[uxn_opcodes_h_l2256_c30_ef5b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_ins;
     sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_x;
     sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_return_output := sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2237_c11_b9bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2226_c11_07c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2249_c11_b189] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_left;
     BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_return_output := BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2254_c11_6f88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_left;
     BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_return_output := BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_9b4d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_9b4d_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2226_DUPLICATE_fa04 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2226_DUPLICATE_fa04_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2261_c11_27a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2238_l2253_l2230_l2245_DUPLICATE_4f52 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2238_l2253_l2230_l2245_DUPLICATE_4f52_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2234_c11_43bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2252_c11_905b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2229_c11_204f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2221_c6_cf36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_left;
     BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_return_output := BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2264_c31_ffc2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2264_c31_ffc2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2264_c31_ffc2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2264_c31_ffc2_return_output := CONST_SR_8_uxn_opcodes_h_l2264_c31_ffc2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2249_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_DUPLICATE_5072 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2249_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_DUPLICATE_5072_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2266_c11_fa37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_left;
     BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_return_output := BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2241_c11_1d9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2244_c11_ef7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2229_l2252_l2226_DUPLICATE_078f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2229_l2252_l2226_DUPLICATE_078f_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2261_c7_e498] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2261_c7_e498_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_f23e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_f23e_return_output := result.u8_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_cf36_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_07c1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_204f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_43bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_b9bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2241_c7_3620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_1d9c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2244_c7_52bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_ef7a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2249_c7_b172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_b189_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_58f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_905b_return_output;
     VAR_MUX_uxn_opcodes_h_l2254_c11_983e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_6f88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_27a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_fa37_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2238_l2253_l2230_l2245_DUPLICATE_4f52_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2238_l2253_l2230_l2245_DUPLICATE_4f52_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2238_l2253_l2230_l2245_DUPLICATE_4f52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2229_l2252_l2226_DUPLICATE_078f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2229_l2252_l2226_DUPLICATE_078f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2229_l2252_l2226_DUPLICATE_078f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2229_l2252_l2226_DUPLICATE_078f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2229_l2252_l2226_DUPLICATE_078f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2229_l2252_l2226_DUPLICATE_078f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2229_l2252_l2226_DUPLICATE_078f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2229_l2252_l2226_DUPLICATE_078f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2229_l2252_l2226_DUPLICATE_078f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2249_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_DUPLICATE_5072_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2249_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_DUPLICATE_5072_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2249_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_DUPLICATE_5072_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2249_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_DUPLICATE_5072_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2249_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_DUPLICATE_5072_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2249_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_DUPLICATE_5072_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2249_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_DUPLICATE_5072_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2249_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_DUPLICATE_5072_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2249_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_DUPLICATE_5072_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2249_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_DUPLICATE_5072_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_9b4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_9b4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_9b4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_9b4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_9b4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_9b4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_9b4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_9b4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_9b4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2226_DUPLICATE_fa04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2226_DUPLICATE_fa04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2226_DUPLICATE_fa04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2226_DUPLICATE_fa04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2226_DUPLICATE_fa04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2226_DUPLICATE_fa04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2226_DUPLICATE_fa04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2226_DUPLICATE_fa04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2226_DUPLICATE_fa04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2266_l2234_l2261_l2229_l2226_DUPLICATE_fa04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_f23e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_f23e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_f23e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_f23e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_f23e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_f23e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_f23e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_f23e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2249_l2221_l2244_l2241_l2237_l2234_l2261_l2229_l2226_DUPLICATE_f23e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2261_c7_e498_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_ef5b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c7_58f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2253_c3_6562] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_left;
     BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_return_output := BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2261_c7_e498] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2238_c3_2e4f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_left;
     BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_return_output := BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2266_c7_2637] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2221_c1_e1f1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2266_c7_2637] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2264_c21_7623] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2264_c21_7623_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2264_c31_ffc2_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2261_c7_e498] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_2e4f_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_6562_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2264_c21_7623_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2246_l2231_DUPLICATE_de32_return_output;
     VAR_printf_uxn_opcodes_h_l2222_c3_c3dd_uxn_opcodes_h_l2222_c3_c3dd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_e1f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2637_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_e498_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2637_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_e498_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2261_c7_e498] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2249_c7_b172] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2254_c26_c502] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_left;
     BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_return_output := BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_return_output;

     -- t16_MUX[uxn_opcodes_h_l2237_c7_e48e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond;
     t16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue;
     t16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output := t16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2261_c7_e498] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_return_output;

     -- printf_uxn_opcodes_h_l2222_c3_c3dd[uxn_opcodes_h_l2222_c3_c3dd] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2222_c3_c3dd_uxn_opcodes_h_l2222_c3_c3dd_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2222_c3_c3dd_uxn_opcodes_h_l2222_c3_c3dd_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l2261_c7_e498] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_return_output := result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_return_output;

     -- n16_MUX[uxn_opcodes_h_l2252_c7_58f4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2252_c7_58f4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2252_c7_58f4_cond;
     n16_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue;
     n16_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output := n16_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c7_58f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2252_c7_58f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2254_c11_983e_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_c502_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_e498_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_e498_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_b172_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_e498_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c7_58f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2234_c7_7e5a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond;
     t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue;
     t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output := t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c7_58f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output;

     -- MUX[uxn_opcodes_h_l2254_c11_983e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2254_c11_983e_cond <= VAR_MUX_uxn_opcodes_h_l2254_c11_983e_cond;
     MUX_uxn_opcodes_h_l2254_c11_983e_iftrue <= VAR_MUX_uxn_opcodes_h_l2254_c11_983e_iftrue;
     MUX_uxn_opcodes_h_l2254_c11_983e_iffalse <= VAR_MUX_uxn_opcodes_h_l2254_c11_983e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2254_c11_983e_return_output := MUX_uxn_opcodes_h_l2254_c11_983e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2244_c7_52bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2249_c7_b172] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_return_output;

     -- n16_MUX[uxn_opcodes_h_l2249_c7_b172] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2249_c7_b172_cond <= VAR_n16_MUX_uxn_opcodes_h_l2249_c7_b172_cond;
     n16_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue;
     n16_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2249_c7_b172_return_output := n16_MUX_uxn_opcodes_h_l2249_c7_b172_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2249_c7_b172] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue := VAR_MUX_uxn_opcodes_h_l2254_c11_983e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2249_c7_b172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_b172_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_b172_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2249_c7_b172] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2252_c7_58f4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_cond;
     tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output := tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2244_c7_52bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2249_c7_b172] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_return_output;

     -- n16_MUX[uxn_opcodes_h_l2244_c7_52bd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2244_c7_52bd_cond <= VAR_n16_MUX_uxn_opcodes_h_l2244_c7_52bd_cond;
     n16_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue;
     n16_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output := n16_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2241_c7_3620] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_return_output;

     -- t16_MUX[uxn_opcodes_h_l2229_c7_59dc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond <= VAR_t16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond;
     t16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue;
     t16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output := t16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2244_c7_52bd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2259_c21_6668] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2259_c21_6668_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2254_c11_983e_return_output);

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2259_c21_6668_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_b172_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_b172_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_3620_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2244_c7_52bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2241_c7_3620] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2244_c7_52bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2249_c7_b172] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_cond;
     tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_return_output := tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2241_c7_3620] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2252_c7_58f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2241_c7_3620] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2241_c7_3620_cond <= VAR_n16_MUX_uxn_opcodes_h_l2241_c7_3620_cond;
     n16_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue;
     n16_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2241_c7_3620_return_output := n16_MUX_uxn_opcodes_h_l2241_c7_3620_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2237_c7_e48e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2226_c7_ff54] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond <= VAR_t16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond;
     t16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue;
     t16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output := t16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2241_c7_3620_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_3620_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_3620_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_58f4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_b172_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2241_c7_3620] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2237_c7_e48e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2241_c7_3620] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_return_output;

     -- n16_MUX[uxn_opcodes_h_l2237_c7_e48e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond;
     n16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue;
     n16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output := n16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2234_c7_7e5a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2249_c7_b172] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_return_output := result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_return_output;

     -- t16_MUX[uxn_opcodes_h_l2221_c2_63ed] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond <= VAR_t16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond;
     t16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue;
     t16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output := t16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2237_c7_e48e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2244_c7_52bd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_cond;
     tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output := tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_3620_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_3620_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_b172_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output;
     -- n16_MUX[uxn_opcodes_h_l2234_c7_7e5a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond;
     n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue;
     n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output := n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2244_c7_52bd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2237_c7_e48e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2234_c7_7e5a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2234_c7_7e5a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2229_c7_59dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2237_c7_e48e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2241_c7_3620] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_cond;
     tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_return_output := tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_52bd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_3620_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2234_c7_7e5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2229_c7_59dc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond;
     n16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue;
     n16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output := n16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2229_c7_59dc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2241_c7_3620] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_return_output := result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2226_c7_ff54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2237_c7_e48e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_cond;
     tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output := tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2234_c7_7e5a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2229_c7_59dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_3620_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2226_c7_ff54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2226_c7_ff54] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2237_c7_e48e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2229_c7_59dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2229_c7_59dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2234_c7_7e5a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond;
     tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output := tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2226_c7_ff54] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond;
     n16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue;
     n16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output := n16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2221_c2_63ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_e48e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2226_c7_ff54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2221_c2_63ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2221_c2_63ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2234_c7_7e5a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2229_c7_59dc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_cond;
     tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output := tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2226_c7_ff54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;

     -- n16_MUX[uxn_opcodes_h_l2221_c2_63ed] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond <= VAR_n16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond;
     n16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue;
     n16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output := n16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7e5a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2229_c7_59dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2226_c7_ff54] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_cond;
     tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output := tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2221_c2_63ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2221_c2_63ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_59dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2226_c7_ff54] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output := result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2221_c2_63ed] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_cond;
     tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output := tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output;

     -- Submodule level 13
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_ff54_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2221_c2_63ed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output := result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output;

     -- Submodule level 14
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2217_l2271_DUPLICATE_c632 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2217_l2271_DUPLICATE_c632_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_63ed_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2217_l2271_DUPLICATE_c632_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2217_l2271_DUPLICATE_c632_return_output;
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
