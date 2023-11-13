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
-- Submodules: 77
entity sta2_0CLK_7d7b1f8b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_7d7b1f8b;
architecture arch of sta2_0CLK_7d7b1f8b is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2213_c6_c9e1]
signal BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2213_c1_0791]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2213_c2_de37]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2213_c2_de37]
signal result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2213_c2_de37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2213_c2_de37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2213_c2_de37]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2213_c2_de37]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2213_c2_de37]
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2213_c2_de37]
signal t16_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2213_c2_de37]
signal n16_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2214_c3_5b8c[uxn_opcodes_h_l2214_c3_5b8c]
signal printf_uxn_opcodes_h_l2214_c3_5b8c_uxn_opcodes_h_l2214_c3_5b8c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2218_c11_b342]
signal BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2218_c7_9425]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2218_c7_9425]
signal result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2218_c7_9425]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2218_c7_9425]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2218_c7_9425]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2218_c7_9425]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2218_c7_9425]
signal result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2218_c7_9425]
signal t16_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2218_c7_9425]
signal n16_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2221_c11_86bb]
signal BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2221_c7_2ee3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2221_c7_2ee3]
signal result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2221_c7_2ee3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2221_c7_2ee3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2221_c7_2ee3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2221_c7_2ee3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2221_c7_2ee3]
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2221_c7_2ee3]
signal t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2221_c7_2ee3]
signal n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2226_c11_ee1c]
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2226_c7_8db1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2226_c7_8db1]
signal result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2226_c7_8db1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2226_c7_8db1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2226_c7_8db1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2226_c7_8db1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2226_c7_8db1]
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2226_c7_8db1]
signal t16_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2226_c7_8db1]
signal n16_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2227_c3_463e]
signal BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2230_c11_6845]
signal BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2230_c7_a803]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2230_c7_a803]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2230_c7_a803]
signal result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2230_c7_a803]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2230_c7_a803]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2230_c7_a803]
signal result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2230_c7_a803]
signal n16_MUX_uxn_opcodes_h_l2230_c7_a803_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2230_c7_a803_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2234_c11_effa]
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2234_c7_57f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2234_c7_57f0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2234_c7_57f0]
signal result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2234_c7_57f0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2234_c7_57f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2234_c7_57f0]
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2234_c7_57f0]
signal n16_MUX_uxn_opcodes_h_l2234_c7_57f0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2235_c3_70d5]
signal BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2237_c30_d547]
signal sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2240_c31_5456]
signal CONST_SR_8_uxn_opcodes_h_l2240_c31_5456_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2240_c31_5456_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2242_c11_c341]
signal BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2242_c7_2e0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2242_c7_2e0c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2242_c7_2e0c]
signal result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2242_c7_2e0c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2242_c7_2e0c]
signal result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2244_c22_35f6]
signal BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2247_c11_be1b]
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2247_c7_b0d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2247_c7_b0d7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_69e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1
BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_left,
BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_right,
BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37
result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_cond,
result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_cond,
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_return_output);

-- t16_MUX_uxn_opcodes_h_l2213_c2_de37
t16_MUX_uxn_opcodes_h_l2213_c2_de37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2213_c2_de37_cond,
t16_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue,
t16_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse,
t16_MUX_uxn_opcodes_h_l2213_c2_de37_return_output);

-- n16_MUX_uxn_opcodes_h_l2213_c2_de37
n16_MUX_uxn_opcodes_h_l2213_c2_de37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2213_c2_de37_cond,
n16_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue,
n16_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse,
n16_MUX_uxn_opcodes_h_l2213_c2_de37_return_output);

-- printf_uxn_opcodes_h_l2214_c3_5b8c_uxn_opcodes_h_l2214_c3_5b8c
printf_uxn_opcodes_h_l2214_c3_5b8c_uxn_opcodes_h_l2214_c3_5b8c : entity work.printf_uxn_opcodes_h_l2214_c3_5b8c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2214_c3_5b8c_uxn_opcodes_h_l2214_c3_5b8c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_left,
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_right,
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_cond,
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_cond,
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_return_output);

-- t16_MUX_uxn_opcodes_h_l2218_c7_9425
t16_MUX_uxn_opcodes_h_l2218_c7_9425 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2218_c7_9425_cond,
t16_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue,
t16_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse,
t16_MUX_uxn_opcodes_h_l2218_c7_9425_return_output);

-- n16_MUX_uxn_opcodes_h_l2218_c7_9425
n16_MUX_uxn_opcodes_h_l2218_c7_9425 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2218_c7_9425_cond,
n16_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue,
n16_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse,
n16_MUX_uxn_opcodes_h_l2218_c7_9425_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb
BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_left,
BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_right,
BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3
result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond,
result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3
result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3
result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output);

-- t16_MUX_uxn_opcodes_h_l2221_c7_2ee3
t16_MUX_uxn_opcodes_h_l2221_c7_2ee3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond,
t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue,
t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse,
t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output);

-- n16_MUX_uxn_opcodes_h_l2221_c7_2ee3
n16_MUX_uxn_opcodes_h_l2221_c7_2ee3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond,
n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue,
n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse,
n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_left,
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_right,
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_cond,
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output);

-- t16_MUX_uxn_opcodes_h_l2226_c7_8db1
t16_MUX_uxn_opcodes_h_l2226_c7_8db1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2226_c7_8db1_cond,
t16_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue,
t16_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse,
t16_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output);

-- n16_MUX_uxn_opcodes_h_l2226_c7_8db1
n16_MUX_uxn_opcodes_h_l2226_c7_8db1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2226_c7_8db1_cond,
n16_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue,
n16_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse,
n16_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e
BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_left,
BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_right,
BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845
BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_left,
BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_right,
BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803
result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803
result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803
result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_cond,
result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803
result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803
result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803
result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_cond,
result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_return_output);

-- n16_MUX_uxn_opcodes_h_l2230_c7_a803
n16_MUX_uxn_opcodes_h_l2230_c7_a803 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2230_c7_a803_cond,
n16_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue,
n16_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse,
n16_MUX_uxn_opcodes_h_l2230_c7_a803_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_left,
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_right,
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_cond,
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output);

-- n16_MUX_uxn_opcodes_h_l2234_c7_57f0
n16_MUX_uxn_opcodes_h_l2234_c7_57f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2234_c7_57f0_cond,
n16_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue,
n16_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse,
n16_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5
BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_left,
BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_right,
BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2237_c30_d547
sp_relative_shift_uxn_opcodes_h_l2237_c30_d547 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_ins,
sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_x,
sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_y,
sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2240_c31_5456
CONST_SR_8_uxn_opcodes_h_l2240_c31_5456 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2240_c31_5456_x,
CONST_SR_8_uxn_opcodes_h_l2240_c31_5456_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_left,
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_right,
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c
result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond,
result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c
result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6
BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_left,
BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_right,
BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_left,
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_right,
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac
CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_return_output,
 t16_MUX_uxn_opcodes_h_l2213_c2_de37_return_output,
 n16_MUX_uxn_opcodes_h_l2213_c2_de37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_return_output,
 t16_MUX_uxn_opcodes_h_l2218_c7_9425_return_output,
 n16_MUX_uxn_opcodes_h_l2218_c7_9425_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output,
 t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output,
 n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output,
 t16_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output,
 n16_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_return_output,
 n16_MUX_uxn_opcodes_h_l2230_c7_a803_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output,
 n16_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_return_output,
 sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_return_output,
 CONST_SR_8_uxn_opcodes_h_l2240_c31_5456_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2215_c3_ac0f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2218_c7_9425_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c2_de37_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c2_de37_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2214_c3_5b8c_uxn_opcodes_h_l2214_c3_5b8c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2219_c3_dd0e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2218_c7_9425_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2224_c3_afb7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2228_c3_c2d2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2226_c7_8db1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2230_c7_a803_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_8db1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2230_c7_a803_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_57f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_5456_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_5456_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2240_c21_2586_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2244_c3_4e57 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2245_c21_6155_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3b57_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_208f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_419f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_565d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3699_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_ca48_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2222_l2227_l2231_l2235_DUPLICATE_62e7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l2252_l2209_DUPLICATE_4e2e_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2215_c3_ac0f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2215_c3_ac0f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_y := to_signed(-4, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2224_c3_afb7 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2224_c3_afb7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2219_c3_dd0e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2219_c3_dd0e;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2228_c3_c2d2 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2228_c3_c2d2;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2234_c11_effa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_565d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_565d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_208f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_208f_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2242_c11_c341] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_left;
     BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_return_output := BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2213_c6_c9e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2237_c30_d547] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_ins;
     sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_x;
     sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_return_output := sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2226_c11_ee1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2244_c22_35f6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2226_c7_8db1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2226_c7_8db1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2221_c11_86bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2230_c11_6845] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_left;
     BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_return_output := BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2245_c21_6155] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2245_c21_6155_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_ca48 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_ca48_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2218_c11_b342] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_left;
     BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_return_output := BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2247_c11_be1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2222_l2227_l2231_l2235_DUPLICATE_62e7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2222_l2227_l2231_l2235_DUPLICATE_62e7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3699 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3699_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_419f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_419f_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3b57 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3b57_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2213_c2_de37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2213_c2_de37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c9e1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2218_c7_9425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2218_c7_9425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_b342_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_86bb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_8db1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_8db1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_ee1c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2230_c7_a803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_6845_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_57f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_effa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_c341_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_be1b_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2244_c3_4e57 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_35f6_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2222_l2227_l2231_l2235_DUPLICATE_62e7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2222_l2227_l2231_l2235_DUPLICATE_62e7_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2222_l2227_l2231_l2235_DUPLICATE_62e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2245_c21_6155_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_565d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_565d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_565d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_565d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_565d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_565d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_208f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_208f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_208f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_208f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_208f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_208f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_ca48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_ca48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_ca48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_ca48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_ca48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_ca48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_ca48_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_419f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_419f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_419f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_419f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_419f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_419f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_419f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3b57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3b57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3b57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3b57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3b57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3b57_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3699_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3699_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3699_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3699_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3699_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_3699_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2226_c7_8db1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_d547_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2244_c3_4e57;
     -- result_u16_value_MUX[uxn_opcodes_h_l2242_c7_2e0c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output := result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2226_c7_8db1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2242_c7_2e0c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2235_c3_70d5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_left;
     BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_return_output := BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2213_c1_0791] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2247_c7_b0d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2242_c7_2e0c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2234_c7_57f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2227_c3_463e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_left;
     BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_return_output := BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2247_c7_b0d7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_463e_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_5456_x := VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_70d5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_efac_return_output;
     VAR_printf_uxn_opcodes_h_l2214_c3_5b8c_uxn_opcodes_h_l2214_c3_5b8c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_0791_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_b0d7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_b0d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2242_c7_2e0c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2230_c7_a803] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2242_c7_2e0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2240_c31_5456] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2240_c31_5456_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_5456_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_5456_return_output := CONST_SR_8_uxn_opcodes_h_l2240_c31_5456_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2221_c7_2ee3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2234_c7_57f0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2234_c7_57f0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_57f0_cond;
     n16_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue;
     n16_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output := n16_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2234_c7_57f0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output := result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output;

     -- printf_uxn_opcodes_h_l2214_c3_5b8c[uxn_opcodes_h_l2214_c3_5b8c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2214_c3_5b8c_uxn_opcodes_h_l2214_c3_5b8c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2214_c3_5b8c_uxn_opcodes_h_l2214_c3_5b8c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2234_c7_57f0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2226_c7_8db1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2226_c7_8db1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2226_c7_8db1_cond;
     t16_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue;
     t16_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output := t16_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_2e0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_a803_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2230_c7_a803] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2234_c7_57f0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2234_c7_57f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2221_c7_2ee3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond;
     t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue;
     t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output := t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2226_c7_8db1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2218_c7_9425] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2230_c7_a803] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_return_output := result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2240_c21_2586] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2240_c21_2586_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_5456_return_output);

     -- n16_MUX[uxn_opcodes_h_l2230_c7_a803] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2230_c7_a803_cond <= VAR_n16_MUX_uxn_opcodes_h_l2230_c7_a803_cond;
     n16_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue;
     n16_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2230_c7_a803_return_output := n16_MUX_uxn_opcodes_h_l2230_c7_a803_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2240_c21_2586_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2230_c7_a803_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_a803_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_a803_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2234_c7_57f0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2226_c7_8db1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output := result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2213_c2_de37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_return_output;

     -- n16_MUX[uxn_opcodes_h_l2226_c7_8db1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2226_c7_8db1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_8db1_cond;
     n16_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue;
     n16_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output := n16_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2221_c7_2ee3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2218_c7_9425] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2218_c7_9425_cond <= VAR_t16_MUX_uxn_opcodes_h_l2218_c7_9425_cond;
     t16_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue;
     t16_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2218_c7_9425_return_output := t16_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2230_c7_a803] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2230_c7_a803] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2226_c7_8db1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_a803_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_a803_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_57f0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2221_c7_2ee3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output := result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2230_c7_a803] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_return_output := result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2221_c7_2ee3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2218_c7_9425] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;

     -- t16_MUX[uxn_opcodes_h_l2213_c2_de37] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2213_c2_de37_cond <= VAR_t16_MUX_uxn_opcodes_h_l2213_c2_de37_cond;
     t16_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue;
     t16_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2213_c2_de37_return_output := t16_MUX_uxn_opcodes_h_l2213_c2_de37_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2226_c7_8db1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2221_c7_2ee3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond;
     n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue;
     n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output := n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2226_c7_8db1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_a803_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2213_c2_de37_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2221_c7_2ee3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2218_c7_9425] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2226_c7_8db1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2218_c7_9425] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_return_output := result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;

     -- n16_MUX[uxn_opcodes_h_l2218_c7_9425] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2218_c7_9425_cond <= VAR_n16_MUX_uxn_opcodes_h_l2218_c7_9425_cond;
     n16_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue;
     n16_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2218_c7_9425_return_output := n16_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2213_c2_de37] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2221_c7_2ee3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_8db1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2218_c7_9425] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2218_c7_9425] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2221_c7_2ee3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2213_c2_de37] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_return_output := result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_return_output;

     -- n16_MUX[uxn_opcodes_h_l2213_c2_de37] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2213_c2_de37_cond <= VAR_n16_MUX_uxn_opcodes_h_l2213_c2_de37_cond;
     n16_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue;
     n16_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2213_c2_de37_return_output := n16_MUX_uxn_opcodes_h_l2213_c2_de37_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2213_c2_de37] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2213_c2_de37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_2ee3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2213_c2_de37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2218_c7_9425] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_return_output := result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2213_c2_de37] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_9425_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2213_c2_de37] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_return_output := result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l2252_l2209_DUPLICATE_4e2e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l2252_l2209_DUPLICATE_4e2e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_69e5(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_de37_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_de37_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_de37_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_de37_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_de37_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_de37_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_de37_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l2252_l2209_DUPLICATE_4e2e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l2252_l2209_DUPLICATE_4e2e_return_output;
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
