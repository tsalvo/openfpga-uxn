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
-- BIN_OP_EQ[uxn_opcodes_h_l2226_c6_e7a9]
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2226_c1_9ff2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2226_c2_364d]
signal t16_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2226_c2_364d]
signal tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2226_c2_364d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2226_c2_364d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2226_c2_364d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2226_c2_364d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2226_c2_364d]
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2226_c2_364d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2226_c2_364d]
signal n16_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2227_c3_1fd9[uxn_opcodes_h_l2227_c3_1fd9]
signal printf_uxn_opcodes_h_l2227_c3_1fd9_uxn_opcodes_h_l2227_c3_1fd9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2231_c11_adc3]
signal BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2231_c7_0c87]
signal t16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2231_c7_0c87]
signal tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2231_c7_0c87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2231_c7_0c87]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2231_c7_0c87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2231_c7_0c87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2231_c7_0c87]
signal result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2231_c7_0c87]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2231_c7_0c87]
signal n16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2234_c11_1c6d]
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2234_c7_9033]
signal t16_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2234_c7_9033]
signal tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2234_c7_9033]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2234_c7_9033]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2234_c7_9033]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2234_c7_9033]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2234_c7_9033]
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2234_c7_9033]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2234_c7_9033]
signal n16_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2239_c11_0ada]
signal BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2239_c7_8259]
signal t16_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2239_c7_8259]
signal tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2239_c7_8259]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2239_c7_8259]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2239_c7_8259]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2239_c7_8259]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2239_c7_8259]
signal result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2239_c7_8259]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2239_c7_8259]
signal n16_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2242_c11_0e47]
signal BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2242_c7_48a9]
signal t16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2242_c7_48a9]
signal tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2242_c7_48a9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2242_c7_48a9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2242_c7_48a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2242_c7_48a9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2242_c7_48a9]
signal result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2242_c7_48a9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2242_c7_48a9]
signal n16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2243_c3_c41b]
signal BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2246_c11_a7a8]
signal BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2246_c7_e502]
signal tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2246_c7_e502]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2246_c7_e502]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2246_c7_e502]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2246_c7_e502]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2246_c7_e502]
signal result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2246_c7_e502]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2246_c7_e502]
signal n16_MUX_uxn_opcodes_h_l2246_c7_e502_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2246_c7_e502_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2249_c11_82b3]
signal BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2249_c7_0d87]
signal tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2249_c7_0d87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2249_c7_0d87]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2249_c7_0d87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2249_c7_0d87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2249_c7_0d87]
signal result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2249_c7_0d87]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2249_c7_0d87]
signal n16_MUX_uxn_opcodes_h_l2249_c7_0d87_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2254_c11_29a4]
signal BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2254_c7_09c2]
signal tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2254_c7_09c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2254_c7_09c2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2254_c7_09c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2254_c7_09c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2254_c7_09c2]
signal result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2254_c7_09c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2254_c7_09c2]
signal n16_MUX_uxn_opcodes_h_l2254_c7_09c2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2257_c11_5116]
signal BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2257_c7_744c]
signal tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2257_c7_744c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2257_c7_744c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2257_c7_744c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2257_c7_744c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2257_c7_744c]
signal result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2257_c7_744c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2257_c7_744c]
signal n16_MUX_uxn_opcodes_h_l2257_c7_744c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2257_c7_744c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2258_c3_0a48]
signal BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2259_c11_ea7a]
signal BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2259_c26_2e00]
signal BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2259_c11_5d71]
signal MUX_uxn_opcodes_h_l2259_c11_5d71_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2259_c11_5d71_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2259_c11_5d71_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2259_c11_5d71_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2261_c30_1560]
signal sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2266_c11_73eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2266_c7_4189]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2266_c7_4189]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2266_c7_4189]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2266_c7_4189]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2266_c7_4189]
signal result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2269_c31_8dee]
signal CONST_SR_8_uxn_opcodes_h_l2269_c31_8dee_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2269_c31_8dee_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2271_c11_7f30]
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2271_c7_795f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2271_c7_795f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9
BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_left,
BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_right,
BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_return_output);

-- t16_MUX_uxn_opcodes_h_l2226_c2_364d
t16_MUX_uxn_opcodes_h_l2226_c2_364d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2226_c2_364d_cond,
t16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue,
t16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse,
t16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2226_c2_364d
tmp16_MUX_uxn_opcodes_h_l2226_c2_364d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_cond,
tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d
result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d
result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_return_output);

-- n16_MUX_uxn_opcodes_h_l2226_c2_364d
n16_MUX_uxn_opcodes_h_l2226_c2_364d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2226_c2_364d_cond,
n16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue,
n16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse,
n16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output);

-- printf_uxn_opcodes_h_l2227_c3_1fd9_uxn_opcodes_h_l2227_c3_1fd9
printf_uxn_opcodes_h_l2227_c3_1fd9_uxn_opcodes_h_l2227_c3_1fd9 : entity work.printf_uxn_opcodes_h_l2227_c3_1fd9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2227_c3_1fd9_uxn_opcodes_h_l2227_c3_1fd9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3
BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_left,
BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_right,
BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_return_output);

-- t16_MUX_uxn_opcodes_h_l2231_c7_0c87
t16_MUX_uxn_opcodes_h_l2231_c7_0c87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond,
t16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue,
t16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse,
t16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87
tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond,
tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue,
tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse,
tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87
result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87
result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87
result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87
result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_cond,
result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87
result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output);

-- n16_MUX_uxn_opcodes_h_l2231_c7_0c87
n16_MUX_uxn_opcodes_h_l2231_c7_0c87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond,
n16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue,
n16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse,
n16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_left,
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_right,
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_return_output);

-- t16_MUX_uxn_opcodes_h_l2234_c7_9033
t16_MUX_uxn_opcodes_h_l2234_c7_9033 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2234_c7_9033_cond,
t16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue,
t16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse,
t16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2234_c7_9033
tmp16_MUX_uxn_opcodes_h_l2234_c7_9033 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_cond,
tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue,
tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse,
tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_cond,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_return_output);

-- n16_MUX_uxn_opcodes_h_l2234_c7_9033
n16_MUX_uxn_opcodes_h_l2234_c7_9033 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2234_c7_9033_cond,
n16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue,
n16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse,
n16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada
BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_left,
BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_right,
BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_return_output);

-- t16_MUX_uxn_opcodes_h_l2239_c7_8259
t16_MUX_uxn_opcodes_h_l2239_c7_8259 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2239_c7_8259_cond,
t16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue,
t16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse,
t16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2239_c7_8259
tmp16_MUX_uxn_opcodes_h_l2239_c7_8259 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_cond,
tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue,
tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse,
tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259
result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259
result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259
result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259
result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_cond,
result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259
result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_return_output);

-- n16_MUX_uxn_opcodes_h_l2239_c7_8259
n16_MUX_uxn_opcodes_h_l2239_c7_8259 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2239_c7_8259_cond,
n16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue,
n16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse,
n16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_left,
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_right,
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_return_output);

-- t16_MUX_uxn_opcodes_h_l2242_c7_48a9
t16_MUX_uxn_opcodes_h_l2242_c7_48a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond,
t16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue,
t16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse,
t16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9
tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond,
tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9
result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output);

-- n16_MUX_uxn_opcodes_h_l2242_c7_48a9
n16_MUX_uxn_opcodes_h_l2242_c7_48a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond,
n16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue,
n16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse,
n16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b
BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_left,
BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_right,
BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8
BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_left,
BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_right,
BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2246_c7_e502
tmp16_MUX_uxn_opcodes_h_l2246_c7_e502 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_cond,
tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue,
tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse,
tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502
result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502
result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502
result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502
result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_cond,
result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502
result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_return_output);

-- n16_MUX_uxn_opcodes_h_l2246_c7_e502
n16_MUX_uxn_opcodes_h_l2246_c7_e502 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2246_c7_e502_cond,
n16_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue,
n16_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse,
n16_MUX_uxn_opcodes_h_l2246_c7_e502_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3
BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_left,
BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_right,
BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87
tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_cond,
tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue,
tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse,
tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87
result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87
result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87
result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87
result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_cond,
result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87
result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output);

-- n16_MUX_uxn_opcodes_h_l2249_c7_0d87
n16_MUX_uxn_opcodes_h_l2249_c7_0d87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2249_c7_0d87_cond,
n16_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue,
n16_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse,
n16_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4
BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_left,
BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_right,
BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2
tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_cond,
tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2
result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2
result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2
result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2
result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output);

-- n16_MUX_uxn_opcodes_h_l2254_c7_09c2
n16_MUX_uxn_opcodes_h_l2254_c7_09c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2254_c7_09c2_cond,
n16_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue,
n16_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse,
n16_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116
BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_left,
BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_right,
BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2257_c7_744c
tmp16_MUX_uxn_opcodes_h_l2257_c7_744c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_cond,
tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c
result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c
result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c
result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c
result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_return_output);

-- n16_MUX_uxn_opcodes_h_l2257_c7_744c
n16_MUX_uxn_opcodes_h_l2257_c7_744c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2257_c7_744c_cond,
n16_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue,
n16_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse,
n16_MUX_uxn_opcodes_h_l2257_c7_744c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48
BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_left,
BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_right,
BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a
BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_left,
BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_right,
BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00
BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_left,
BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_right,
BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_return_output);

-- MUX_uxn_opcodes_h_l2259_c11_5d71
MUX_uxn_opcodes_h_l2259_c11_5d71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2259_c11_5d71_cond,
MUX_uxn_opcodes_h_l2259_c11_5d71_iftrue,
MUX_uxn_opcodes_h_l2259_c11_5d71_iffalse,
MUX_uxn_opcodes_h_l2259_c11_5d71_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2261_c30_1560
sp_relative_shift_uxn_opcodes_h_l2261_c30_1560 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_ins,
sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_x,
sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_y,
sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb
BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189
result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189
result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189
result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189
result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_cond,
result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2269_c31_8dee
CONST_SR_8_uxn_opcodes_h_l2269_c31_8dee : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2269_c31_8dee_x,
CONST_SR_8_uxn_opcodes_h_l2269_c31_8dee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_left,
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_right,
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc
CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_return_output,
 t16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_return_output,
 n16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_return_output,
 t16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output,
 tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output,
 n16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_return_output,
 t16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output,
 tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_return_output,
 n16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_return_output,
 t16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output,
 tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_return_output,
 n16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_return_output,
 t16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output,
 n16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_return_output,
 n16_MUX_uxn_opcodes_h_l2246_c7_e502_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output,
 n16_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output,
 n16_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_return_output,
 tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_return_output,
 n16_MUX_uxn_opcodes_h_l2257_c7_744c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_return_output,
 MUX_uxn_opcodes_h_l2259_c11_5d71_return_output,
 sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_return_output,
 CONST_SR_8_uxn_opcodes_h_l2269_c31_8dee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2228_c3_4887 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c2_364d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2227_c3_1fd9_uxn_opcodes_h_l2227_c3_1fd9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2232_c3_dc13 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2237_c3_9117 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2240_c3_4e5b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2239_c7_8259_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2244_c3_a709 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2246_c7_e502_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2247_c3_0615 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2246_c7_e502_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2252_c3_1544 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2249_c7_0d87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2255_c3_11b7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2257_c7_744c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2254_c7_09c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2263_c3_d45d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2257_c7_744c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2259_c11_5d71_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2259_c11_5d71_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2259_c11_5d71_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2259_c11_5d71_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2264_c21_50f6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2268_c3_ca6d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2266_c7_4189_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2269_c31_8dee_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2269_c31_8dee_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2269_c21_ff49_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_54b0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_3ff3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_362b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2234_l2257_l2231_l2254_l2226_l2249_DUPLICATE_40ea_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2257_l2231_l2254_l2249_DUPLICATE_1bff_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2235_l2250_l2243_l2258_DUPLICATE_2447_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2276_l2222_DUPLICATE_7ec4_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2268_c3_ca6d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2268_c3_ca6d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2252_c3_1544 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2252_c3_1544;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2244_c3_a709 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2244_c3_a709;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2240_c3_4e5b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2240_c3_4e5b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2232_c3_dc13 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2232_c3_dc13;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2263_c3_d45d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2263_c3_d45d;
     VAR_MUX_uxn_opcodes_h_l2259_c11_5d71_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2237_c3_9117 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2237_c3_9117;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2247_c3_0615 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2247_c3_0615;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2255_c3_11b7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2255_c3_11b7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2228_c3_4887 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2228_c3_4887;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2269_c31_8dee_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2226_c6_e7a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2261_c30_1560] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_ins;
     sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_x;
     sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_return_output := sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2254_c11_29a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2249_c11_82b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2266_c7_4189] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2266_c7_4189_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_3ff3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_3ff3_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2242_c11_0e47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_left;
     BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_return_output := BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2257_c11_5116] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_left;
     BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_return_output := BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2235_l2250_l2243_l2258_DUPLICATE_2447 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2235_l2250_l2243_l2258_DUPLICATE_2447_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2257_l2231_l2254_l2249_DUPLICATE_1bff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2257_l2231_l2254_l2249_DUPLICATE_1bff_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2271_c11_7f30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_left;
     BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_return_output := BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2231_c11_adc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2234_c11_1c6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_362b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_362b_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l2269_c31_8dee] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2269_c31_8dee_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2269_c31_8dee_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2269_c31_8dee_return_output := CONST_SR_8_uxn_opcodes_h_l2269_c31_8dee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2239_c11_0ada] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_left;
     BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_return_output := BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_54b0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_54b0_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2246_c11_a7a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2234_l2257_l2231_l2254_l2226_l2249_DUPLICATE_40ea LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2234_l2257_l2231_l2254_l2226_l2249_DUPLICATE_40ea_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2259_c11_ea7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2266_c11_73eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c2_364d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2226_c2_364d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c6_e7a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_adc3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2234_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_1c6d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2239_c7_8259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2239_c7_8259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_0ada_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_0e47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2246_c7_e502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c11_a7a8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2249_c7_0d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_82b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2254_c7_09c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_29a4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2257_c7_744c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_5116_return_output;
     VAR_MUX_uxn_opcodes_h_l2259_c11_5d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_ea7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_73eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7f30_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2235_l2250_l2243_l2258_DUPLICATE_2447_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2235_l2250_l2243_l2258_DUPLICATE_2447_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2235_l2250_l2243_l2258_DUPLICATE_2447_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2234_l2257_l2231_l2254_l2226_l2249_DUPLICATE_40ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2234_l2257_l2231_l2254_l2226_l2249_DUPLICATE_40ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2234_l2257_l2231_l2254_l2226_l2249_DUPLICATE_40ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2234_l2257_l2231_l2254_l2226_l2249_DUPLICATE_40ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2234_l2257_l2231_l2254_l2226_l2249_DUPLICATE_40ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2234_l2257_l2231_l2254_l2226_l2249_DUPLICATE_40ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2234_l2257_l2231_l2254_l2226_l2249_DUPLICATE_40ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2234_l2257_l2231_l2254_l2226_l2249_DUPLICATE_40ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2234_l2257_l2231_l2254_l2226_l2249_DUPLICATE_40ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2257_l2231_l2254_l2249_DUPLICATE_1bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2257_l2231_l2254_l2249_DUPLICATE_1bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2257_l2231_l2254_l2249_DUPLICATE_1bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2257_l2231_l2254_l2249_DUPLICATE_1bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2257_l2231_l2254_l2249_DUPLICATE_1bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2257_l2231_l2254_l2249_DUPLICATE_1bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2257_l2231_l2254_l2249_DUPLICATE_1bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2257_l2231_l2254_l2249_DUPLICATE_1bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2257_l2231_l2254_l2249_DUPLICATE_1bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2257_l2231_l2254_l2249_DUPLICATE_1bff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_54b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_54b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_54b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_54b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_54b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_54b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_54b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_54b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_54b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_3ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_3ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_3ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_3ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_3ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_3ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_3ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_3ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_3ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2246_l2242_l2271_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_3ff3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_362b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_362b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_362b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_362b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_362b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_362b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_362b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_362b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2246_l2242_l2239_l2266_l2234_l2231_l2254_l2226_l2249_DUPLICATE_362b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2266_c7_4189_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2261_c30_1560_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2266_c7_4189] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2258_c3_0a48] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_left;
     BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_return_output := BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2271_c7_795f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2257_c7_744c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2271_c7_795f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2226_c1_9ff2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2269_c21_ff49] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2269_c21_ff49_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2269_c31_8dee_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2266_c7_4189] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2243_c3_c41b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_left;
     BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_return_output := BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2243_c3_c41b_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2258_c3_0a48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2269_c21_ff49_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2236_l2251_DUPLICATE_bddc_return_output;
     VAR_printf_uxn_opcodes_h_l2227_c3_1fd9_uxn_opcodes_h_l2227_c3_1fd9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2226_c1_9ff2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_795f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2266_c7_4189_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_795f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_744c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2266_c7_4189_return_output;
     -- BIN_OP_DIV[uxn_opcodes_h_l2259_c26_2e00] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_left;
     BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_return_output := BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_return_output;

     -- n16_MUX[uxn_opcodes_h_l2257_c7_744c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2257_c7_744c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2257_c7_744c_cond;
     n16_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue;
     n16_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2257_c7_744c_return_output := n16_MUX_uxn_opcodes_h_l2257_c7_744c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2266_c7_4189] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2266_c7_4189] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2266_c7_4189] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_return_output := result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_return_output;

     -- t16_MUX[uxn_opcodes_h_l2242_c7_48a9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond;
     t16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue;
     t16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output := t16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2257_c7_744c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2254_c7_09c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2257_c7_744c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_return_output;

     -- printf_uxn_opcodes_h_l2227_c3_1fd9[uxn_opcodes_h_l2227_c3_1fd9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2227_c3_1fd9_uxn_opcodes_h_l2227_c3_1fd9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2227_c3_1fd9_uxn_opcodes_h_l2227_c3_1fd9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2259_c11_5d71_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2259_c26_2e00_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2257_c7_744c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_4189_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_744c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_4189_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_744c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2266_c7_4189_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;
     -- t16_MUX[uxn_opcodes_h_l2239_c7_8259] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2239_c7_8259_cond <= VAR_t16_MUX_uxn_opcodes_h_l2239_c7_8259_cond;
     t16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue;
     t16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output := t16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2249_c7_0d87] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2257_c7_744c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2254_c7_09c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2257_c7_744c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_return_output;

     -- MUX[uxn_opcodes_h_l2259_c11_5d71] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2259_c11_5d71_cond <= VAR_MUX_uxn_opcodes_h_l2259_c11_5d71_cond;
     MUX_uxn_opcodes_h_l2259_c11_5d71_iftrue <= VAR_MUX_uxn_opcodes_h_l2259_c11_5d71_iftrue;
     MUX_uxn_opcodes_h_l2259_c11_5d71_iffalse <= VAR_MUX_uxn_opcodes_h_l2259_c11_5d71_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2259_c11_5d71_return_output := MUX_uxn_opcodes_h_l2259_c11_5d71_return_output;

     -- n16_MUX[uxn_opcodes_h_l2254_c7_09c2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2254_c7_09c2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2254_c7_09c2_cond;
     n16_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue;
     n16_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output := n16_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2254_c7_09c2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue := VAR_MUX_uxn_opcodes_h_l2259_c11_5d71_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_744c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_744c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2246_c7_e502] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2254_c7_09c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2249_c7_0d87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2257_c7_744c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_cond;
     tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_return_output := tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2264_c21_50f6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2264_c21_50f6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2259_c11_5d71_return_output);

     -- n16_MUX[uxn_opcodes_h_l2249_c7_0d87] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2249_c7_0d87_cond <= VAR_n16_MUX_uxn_opcodes_h_l2249_c7_0d87_cond;
     n16_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue;
     n16_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output := n16_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output;

     -- t16_MUX[uxn_opcodes_h_l2234_c7_9033] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2234_c7_9033_cond <= VAR_t16_MUX_uxn_opcodes_h_l2234_c7_9033_cond;
     t16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue;
     t16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output := t16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2249_c7_0d87] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2254_c7_09c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2264_c21_50f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c7_e502_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2257_c7_744c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2249_c7_0d87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2254_c7_09c2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_cond;
     tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output := tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2231_c7_0c87] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond <= VAR_t16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond;
     t16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue;
     t16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output := t16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2242_c7_48a9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2246_c7_e502] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2246_c7_e502_cond <= VAR_n16_MUX_uxn_opcodes_h_l2246_c7_e502_cond;
     n16_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue;
     n16_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2246_c7_e502_return_output := n16_MUX_uxn_opcodes_h_l2246_c7_e502_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2246_c7_e502] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2249_c7_0d87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2246_c7_e502] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2257_c7_744c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2246_c7_e502_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c7_e502_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c7_e502_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2257_c7_744c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output;
     -- n16_MUX[uxn_opcodes_h_l2242_c7_48a9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond;
     n16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue;
     n16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output := n16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2246_c7_e502] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2242_c7_48a9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2246_c7_e502] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2242_c7_48a9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2254_c7_09c2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2249_c7_0d87] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_cond;
     tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output := tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output;

     -- t16_MUX[uxn_opcodes_h_l2226_c2_364d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2226_c2_364d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2226_c2_364d_cond;
     t16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue;
     t16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output := t16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2239_c7_8259] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c7_e502_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c7_e502_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2254_c7_09c2_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output;
     -- n16_MUX[uxn_opcodes_h_l2239_c7_8259] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2239_c7_8259_cond <= VAR_n16_MUX_uxn_opcodes_h_l2239_c7_8259_cond;
     n16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue;
     n16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output := n16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2234_c7_9033] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2242_c7_48a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2249_c7_0d87] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output := result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2242_c7_48a9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2239_c7_8259] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2239_c7_8259] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2246_c7_e502] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_cond;
     tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_return_output := tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_0d87_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2246_c7_e502_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2246_c7_e502] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_return_output := result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2242_c7_48a9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_cond;
     tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output := tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2239_c7_8259] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;

     -- n16_MUX[uxn_opcodes_h_l2234_c7_9033] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2234_c7_9033_cond <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_9033_cond;
     n16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue;
     n16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output := n16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2239_c7_8259] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2234_c7_9033] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2231_c7_0c87] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2234_c7_9033] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2246_c7_e502_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;
     -- n16_MUX[uxn_opcodes_h_l2231_c7_0c87] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond <= VAR_n16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond;
     n16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue;
     n16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output := n16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2231_c7_0c87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2231_c7_0c87] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2226_c2_364d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2242_c7_48a9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2239_c7_8259] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_cond;
     tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output := tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2234_c7_9033] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2234_c7_9033] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_48a9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2239_c7_8259] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_return_output := result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2231_c7_0c87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;

     -- n16_MUX[uxn_opcodes_h_l2226_c2_364d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2226_c2_364d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2226_c2_364d_cond;
     n16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue;
     n16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output := n16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2231_c7_0c87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2226_c2_364d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2234_c7_9033] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_cond;
     tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output := tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2226_c2_364d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2239_c7_8259_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2234_c7_9033] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_return_output := result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2231_c7_0c87] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_cond;
     tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output := tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2226_c2_364d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2226_c2_364d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_9033_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2226_c2_364d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_cond;
     tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output := tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2231_c7_0c87] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output := result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;

     -- Submodule level 13
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_0c87_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2226_c2_364d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2226_c2_364d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_return_output;

     -- Submodule level 14
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2276_l2222_DUPLICATE_7ec4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2276_l2222_DUPLICATE_7ec4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c2_364d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c2_364d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c2_364d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c2_364d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c2_364d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c2_364d_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2276_l2222_DUPLICATE_7ec4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2276_l2222_DUPLICATE_7ec4_return_output;
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
