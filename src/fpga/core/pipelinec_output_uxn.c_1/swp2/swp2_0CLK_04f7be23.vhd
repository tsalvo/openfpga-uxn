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
-- Submodules: 128
entity swp2_0CLK_04f7be23 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_04f7be23;
architecture arch of swp2_0CLK_04f7be23 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1798_c6_e40e]
signal BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1798_c1_ef1e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1798_c2_9fd5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1798_c2_9fd5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1798_c2_9fd5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1798_c2_9fd5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1798_c2_9fd5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1798_c2_9fd5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1798_c2_9fd5]
signal result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1798_c2_9fd5]
signal t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1798_c2_9fd5]
signal n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1799_c3_23b9[uxn_opcodes_h_l1799_c3_23b9]
signal printf_uxn_opcodes_h_l1799_c3_23b9_uxn_opcodes_h_l1799_c3_23b9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1804_c11_dd30]
signal BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1804_c7_0aca]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1804_c7_0aca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1804_c7_0aca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1804_c7_0aca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1804_c7_0aca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1804_c7_0aca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1804_c7_0aca]
signal result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1804_c7_0aca]
signal t16_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1804_c7_0aca]
signal n16_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1807_c11_e83d]
signal BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1807_c7_5825]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1807_c7_5825]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1807_c7_5825]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1807_c7_5825]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1807_c7_5825]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1807_c7_5825]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1807_c7_5825]
signal result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1807_c7_5825]
signal t16_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1807_c7_5825]
signal n16_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1812_c11_7661]
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1812_c7_ba69]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1812_c7_ba69]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c7_ba69]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1812_c7_ba69]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1812_c7_ba69]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c7_ba69]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1812_c7_ba69]
signal result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1812_c7_ba69]
signal t16_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1812_c7_ba69]
signal n16_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1815_c11_6799]
signal BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1815_c7_2b72]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1815_c7_2b72]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1815_c7_2b72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1815_c7_2b72]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1815_c7_2b72]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1815_c7_2b72]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1815_c7_2b72]
signal result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1815_c7_2b72]
signal t16_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1815_c7_2b72]
signal n16_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1816_c3_d79c]
signal BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1819_c11_4f77]
signal BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1819_c7_c32b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1819_c7_c32b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1819_c7_c32b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1819_c7_c32b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1819_c7_c32b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1819_c7_c32b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1819_c7_c32b]
signal result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1819_c7_c32b]
signal n16_MUX_uxn_opcodes_h_l1819_c7_c32b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1822_c11_cc41]
signal BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1822_c7_7efe]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1822_c7_7efe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1822_c7_7efe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1822_c7_7efe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1822_c7_7efe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1822_c7_7efe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1822_c7_7efe]
signal result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1822_c7_7efe]
signal n16_MUX_uxn_opcodes_h_l1822_c7_7efe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1827_c11_f078]
signal BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1827_c7_046a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1827_c7_046a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1827_c7_046a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1827_c7_046a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1827_c7_046a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1827_c7_046a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1827_c7_046a]
signal result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1827_c7_046a]
signal n16_MUX_uxn_opcodes_h_l1827_c7_046a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1827_c7_046a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1830_c11_d981]
signal BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1830_c7_8193]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1830_c7_8193]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1830_c7_8193]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1830_c7_8193]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1830_c7_8193]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1830_c7_8193]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1830_c7_8193]
signal result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1830_c7_8193]
signal n16_MUX_uxn_opcodes_h_l1830_c7_8193_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1830_c7_8193_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1831_c3_6601]
signal BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1834_c32_0dcf]
signal BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1834_c32_fc2f]
signal BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1834_c32_1f30]
signal MUX_uxn_opcodes_h_l1834_c32_1f30_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1834_c32_1f30_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1834_c32_1f30_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1834_c32_1f30_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1836_c11_240f]
signal BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1836_c7_4932]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1836_c7_4932]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1836_c7_4932]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1836_c7_4932]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1836_c7_4932]
signal result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1842_c11_d938]
signal BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1842_c7_3494]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1842_c7_3494]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1842_c7_3494]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1842_c7_3494]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1842_c7_3494]
signal result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1844_c34_14c0]
signal CONST_SR_8_uxn_opcodes_h_l1844_c34_14c0_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1844_c34_14c0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1846_c11_0364]
signal BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1846_c7_829a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1846_c7_829a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1846_c7_829a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1846_c7_829a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1846_c7_829a]
signal result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1851_c11_c6bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1851_c7_d076]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1851_c7_d076]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1851_c7_d076]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1851_c7_d076]
signal result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1853_c34_fcb2]
signal CONST_SR_8_uxn_opcodes_h_l1853_c34_fcb2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1853_c34_fcb2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1855_c11_42bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1855_c7_3c9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1855_c7_3c9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e
BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_left,
BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_right,
BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5
result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5
result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5
result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5
result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5
result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output);

-- t16_MUX_uxn_opcodes_h_l1798_c2_9fd5
t16_MUX_uxn_opcodes_h_l1798_c2_9fd5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond,
t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue,
t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse,
t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output);

-- n16_MUX_uxn_opcodes_h_l1798_c2_9fd5
n16_MUX_uxn_opcodes_h_l1798_c2_9fd5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond,
n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue,
n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse,
n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output);

-- printf_uxn_opcodes_h_l1799_c3_23b9_uxn_opcodes_h_l1799_c3_23b9
printf_uxn_opcodes_h_l1799_c3_23b9_uxn_opcodes_h_l1799_c3_23b9 : entity work.printf_uxn_opcodes_h_l1799_c3_23b9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1799_c3_23b9_uxn_opcodes_h_l1799_c3_23b9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30
BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_left,
BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_right,
BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca
result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca
result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca
result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca
result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca
result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca
result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_cond,
result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output);

-- t16_MUX_uxn_opcodes_h_l1804_c7_0aca
t16_MUX_uxn_opcodes_h_l1804_c7_0aca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1804_c7_0aca_cond,
t16_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue,
t16_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse,
t16_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output);

-- n16_MUX_uxn_opcodes_h_l1804_c7_0aca
n16_MUX_uxn_opcodes_h_l1804_c7_0aca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1804_c7_0aca_cond,
n16_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue,
n16_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse,
n16_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d
BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_left,
BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_right,
BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825
result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825
result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825
result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825
result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825
result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825
result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_cond,
result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_return_output);

-- t16_MUX_uxn_opcodes_h_l1807_c7_5825
t16_MUX_uxn_opcodes_h_l1807_c7_5825 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1807_c7_5825_cond,
t16_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue,
t16_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse,
t16_MUX_uxn_opcodes_h_l1807_c7_5825_return_output);

-- n16_MUX_uxn_opcodes_h_l1807_c7_5825
n16_MUX_uxn_opcodes_h_l1807_c7_5825 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1807_c7_5825_cond,
n16_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue,
n16_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse,
n16_MUX_uxn_opcodes_h_l1807_c7_5825_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_left,
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_right,
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69
result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69
result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_cond,
result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output);

-- t16_MUX_uxn_opcodes_h_l1812_c7_ba69
t16_MUX_uxn_opcodes_h_l1812_c7_ba69 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1812_c7_ba69_cond,
t16_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue,
t16_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse,
t16_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output);

-- n16_MUX_uxn_opcodes_h_l1812_c7_ba69
n16_MUX_uxn_opcodes_h_l1812_c7_ba69 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1812_c7_ba69_cond,
n16_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue,
n16_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse,
n16_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799
BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_left,
BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_right,
BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72
result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72
result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72
result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72
result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72
result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72
result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_cond,
result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output);

-- t16_MUX_uxn_opcodes_h_l1815_c7_2b72
t16_MUX_uxn_opcodes_h_l1815_c7_2b72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1815_c7_2b72_cond,
t16_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue,
t16_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse,
t16_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output);

-- n16_MUX_uxn_opcodes_h_l1815_c7_2b72
n16_MUX_uxn_opcodes_h_l1815_c7_2b72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1815_c7_2b72_cond,
n16_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue,
n16_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse,
n16_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c
BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_left,
BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_right,
BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77
BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_left,
BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_right,
BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b
result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b
result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b
result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b
result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b
result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output);

-- n16_MUX_uxn_opcodes_h_l1819_c7_c32b
n16_MUX_uxn_opcodes_h_l1819_c7_c32b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1819_c7_c32b_cond,
n16_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue,
n16_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse,
n16_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41
BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_left,
BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_right,
BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe
result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe
result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe
result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe
result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe
result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe
result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_cond,
result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output);

-- n16_MUX_uxn_opcodes_h_l1822_c7_7efe
n16_MUX_uxn_opcodes_h_l1822_c7_7efe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1822_c7_7efe_cond,
n16_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue,
n16_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse,
n16_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078
BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_left,
BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_right,
BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a
result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a
result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a
result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_return_output);

-- n16_MUX_uxn_opcodes_h_l1827_c7_046a
n16_MUX_uxn_opcodes_h_l1827_c7_046a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1827_c7_046a_cond,
n16_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue,
n16_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse,
n16_MUX_uxn_opcodes_h_l1827_c7_046a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981
BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_left,
BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_right,
BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193
result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193
result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193
result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193
result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193
result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193
result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_cond,
result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_return_output);

-- n16_MUX_uxn_opcodes_h_l1830_c7_8193
n16_MUX_uxn_opcodes_h_l1830_c7_8193 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1830_c7_8193_cond,
n16_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue,
n16_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse,
n16_MUX_uxn_opcodes_h_l1830_c7_8193_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601
BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_left,
BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_right,
BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf
BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_left,
BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_right,
BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f
BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_left,
BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_right,
BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_return_output);

-- MUX_uxn_opcodes_h_l1834_c32_1f30
MUX_uxn_opcodes_h_l1834_c32_1f30 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1834_c32_1f30_cond,
MUX_uxn_opcodes_h_l1834_c32_1f30_iftrue,
MUX_uxn_opcodes_h_l1834_c32_1f30_iffalse,
MUX_uxn_opcodes_h_l1834_c32_1f30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_left,
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_right,
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932
result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932
result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932
result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_cond,
result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938
BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_left,
BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_right,
BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494
result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494
result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494
result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494
result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_cond,
result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1844_c34_14c0
CONST_SR_8_uxn_opcodes_h_l1844_c34_14c0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1844_c34_14c0_x,
CONST_SR_8_uxn_opcodes_h_l1844_c34_14c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364
BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_left,
BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_right,
BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a
result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a
result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a
result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a
result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc
BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076
result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076
result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_cond,
result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1853_c34_fcb2
CONST_SR_8_uxn_opcodes_h_l1853_c34_fcb2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1853_c34_fcb2_x,
CONST_SR_8_uxn_opcodes_h_l1853_c34_fcb2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc
BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e
result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e
result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e
CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output,
 t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output,
 n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output,
 t16_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output,
 n16_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_return_output,
 t16_MUX_uxn_opcodes_h_l1807_c7_5825_return_output,
 n16_MUX_uxn_opcodes_h_l1807_c7_5825_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output,
 t16_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output,
 n16_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output,
 t16_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output,
 n16_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output,
 n16_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output,
 n16_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_return_output,
 n16_MUX_uxn_opcodes_h_l1827_c7_046a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_return_output,
 n16_MUX_uxn_opcodes_h_l1830_c7_8193_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_return_output,
 MUX_uxn_opcodes_h_l1834_c32_1f30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_return_output,
 CONST_SR_8_uxn_opcodes_h_l1844_c34_14c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_return_output,
 CONST_SR_8_uxn_opcodes_h_l1853_c34_fcb2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1801_c3_6dad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1799_c3_23b9_uxn_opcodes_h_l1799_c3_23b9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1805_c3_26c0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1807_c7_5825_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1804_c7_0aca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1810_c3_b5f6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1807_c7_5825_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1813_c3_7aad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1812_c7_ba69_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1817_c3_054b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1815_c7_2b72_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1820_c3_3846 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1819_c7_c32b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1825_c3_18a8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1827_c7_046a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1822_c7_7efe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1828_c3_6d5c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1830_c7_8193_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1827_c7_046a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1830_c7_8193_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1834_c32_1f30_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1834_c32_1f30_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1834_c32_1f30_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1834_c32_1f30_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1839_c3_a8b6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1840_c24_3822_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1843_c3_78f6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1844_c34_14c0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1844_c34_14c0_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1844_c24_a76b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1848_c3_13eb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1849_c24_356b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1852_c3_174f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1853_c34_fcb2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1853_c34_fcb2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1853_c24_f147_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1819_l1815_l1812_DUPLICATE_c17a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1855_l1798_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_dfbf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1807_l1804_l1827_l1798_l1822_l1819_l1846_l1815_l1842_l1812_DUPLICATE_5834_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1851_l1819_l1815_l1812_DUPLICATE_a5f8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1822_l1819_l1815_l1812_DUPLICATE_583d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1836_l1807_l1830_l1804_l1827_l1855_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_17d8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1808_l1816_l1823_l1831_DUPLICATE_831d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1851_l1830_DUPLICATE_62a5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1860_l1794_DUPLICATE_3490_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1801_c3_6dad := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1801_c3_6dad;
     VAR_MUX_uxn_opcodes_h_l1834_c32_1f30_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1825_c3_18a8 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1825_c3_18a8;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1813_c3_7aad := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1813_c3_7aad;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1817_c3_054b := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1817_c3_054b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1834_c32_1f30_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1852_c3_174f := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1852_c3_174f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1848_c3_13eb := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1848_c3_13eb;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1820_c3_3846 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1820_c3_3846;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1839_c3_a8b6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1839_c3_a8b6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1843_c3_78f6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1843_c3_78f6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1828_c3_6d5c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1828_c3_6d5c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1810_c3_b5f6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1810_c3_b5f6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1805_c3_26c0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1805_c3_26c0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1844_c34_14c0_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1853_c34_fcb2_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1836_c11_240f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1840_c24_3822] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1840_c24_3822_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1819_l1815_l1812_DUPLICATE_c17a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1819_l1815_l1812_DUPLICATE_c17a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1822_l1819_l1815_l1812_DUPLICATE_583d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1822_l1819_l1815_l1812_DUPLICATE_583d_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1819_c11_4f77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_left;
     BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_return_output := BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1807_l1804_l1827_l1798_l1822_l1819_l1846_l1815_l1842_l1812_DUPLICATE_5834 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1807_l1804_l1827_l1798_l1822_l1819_l1846_l1815_l1842_l1812_DUPLICATE_5834_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1798_c6_e40e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1842_c11_d938] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_left;
     BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_return_output := BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1851_l1830_DUPLICATE_62a5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1851_l1830_DUPLICATE_62a5_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l1834_c32_0dcf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_left;
     BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_return_output := BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1830_c11_d981] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_left;
     BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_return_output := BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1846_c11_0364] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_left;
     BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_return_output := BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1849_c24_356b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1849_c24_356b_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1808_l1816_l1823_l1831_DUPLICATE_831d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1808_l1816_l1823_l1831_DUPLICATE_831d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1815_c11_6799] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_left;
     BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_return_output := BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1851_c11_c6bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1851_l1819_l1815_l1812_DUPLICATE_a5f8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1851_l1819_l1815_l1812_DUPLICATE_a5f8_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1807_c11_e83d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1836_l1807_l1830_l1804_l1827_l1855_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_17d8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1836_l1807_l1830_l1804_l1827_l1855_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_17d8_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1812_c11_7661] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_left;
     BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_return_output := BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1853_c34_fcb2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1853_c34_fcb2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1853_c34_fcb2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1853_c34_fcb2_return_output := CONST_SR_8_uxn_opcodes_h_l1853_c34_fcb2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1855_c11_42bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1822_c11_cc41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_left;
     BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_return_output := BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1855_l1798_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_dfbf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1855_l1798_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_dfbf_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1804_c11_dd30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_left;
     BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_return_output := BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1844_c34_14c0] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1844_c34_14c0_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1844_c34_14c0_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1844_c34_14c0_return_output := CONST_SR_8_uxn_opcodes_h_l1844_c34_14c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1827_c11_f078] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_left;
     BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_return_output := BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1834_c32_0dcf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c6_e40e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1804_c7_0aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1804_c7_0aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1804_c11_dd30_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1807_c7_5825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1807_c7_5825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_e83d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1812_c7_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1812_c7_ba69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_7661_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1815_c7_2b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1815_c7_2b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_6799_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1819_c7_c32b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_4f77_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1822_c7_7efe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_cc41_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1827_c7_046a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_f078_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1830_c7_8193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_d981_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_240f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1842_c11_d938_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_0364_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_c6bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_42bc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1808_l1816_l1823_l1831_DUPLICATE_831d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1808_l1816_l1823_l1831_DUPLICATE_831d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1808_l1816_l1823_l1831_DUPLICATE_831d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1840_c24_3822_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1849_c24_356b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1819_l1815_l1812_DUPLICATE_c17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1819_l1815_l1812_DUPLICATE_c17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1819_l1815_l1812_DUPLICATE_c17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1819_l1815_l1812_DUPLICATE_c17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1819_l1815_l1812_DUPLICATE_c17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1819_l1815_l1812_DUPLICATE_c17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1819_l1815_l1812_DUPLICATE_c17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1819_l1815_l1812_DUPLICATE_c17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1819_l1815_l1812_DUPLICATE_c17a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1836_l1807_l1830_l1804_l1827_l1855_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_17d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1836_l1807_l1830_l1804_l1827_l1855_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_17d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1836_l1807_l1830_l1804_l1827_l1855_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_17d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1836_l1807_l1830_l1804_l1827_l1855_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_17d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1836_l1807_l1830_l1804_l1827_l1855_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_17d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1836_l1807_l1830_l1804_l1827_l1855_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_17d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1836_l1807_l1830_l1804_l1827_l1855_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_17d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1836_l1807_l1830_l1804_l1827_l1855_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_17d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1836_l1807_l1830_l1804_l1827_l1855_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_17d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1836_l1807_l1830_l1804_l1827_l1855_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_17d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1836_l1807_l1830_l1804_l1827_l1855_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_17d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1836_l1807_l1830_l1804_l1827_l1855_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_17d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1836_l1807_l1830_l1804_l1827_l1855_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_17d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1807_l1804_l1827_l1798_l1822_l1819_l1846_l1815_l1842_l1812_DUPLICATE_5834_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1807_l1804_l1827_l1798_l1822_l1819_l1846_l1815_l1842_l1812_DUPLICATE_5834_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1807_l1804_l1827_l1798_l1822_l1819_l1846_l1815_l1842_l1812_DUPLICATE_5834_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1807_l1804_l1827_l1798_l1822_l1819_l1846_l1815_l1842_l1812_DUPLICATE_5834_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1807_l1804_l1827_l1798_l1822_l1819_l1846_l1815_l1842_l1812_DUPLICATE_5834_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1807_l1804_l1827_l1798_l1822_l1819_l1846_l1815_l1842_l1812_DUPLICATE_5834_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1807_l1804_l1827_l1798_l1822_l1819_l1846_l1815_l1842_l1812_DUPLICATE_5834_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1807_l1804_l1827_l1798_l1822_l1819_l1846_l1815_l1842_l1812_DUPLICATE_5834_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1807_l1804_l1827_l1798_l1822_l1819_l1846_l1815_l1842_l1812_DUPLICATE_5834_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1807_l1804_l1827_l1798_l1822_l1819_l1846_l1815_l1842_l1812_DUPLICATE_5834_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1822_l1819_l1815_l1812_DUPLICATE_583d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1822_l1819_l1815_l1812_DUPLICATE_583d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1822_l1819_l1815_l1812_DUPLICATE_583d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1822_l1819_l1815_l1812_DUPLICATE_583d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1822_l1819_l1815_l1812_DUPLICATE_583d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1822_l1819_l1815_l1812_DUPLICATE_583d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1822_l1819_l1815_l1812_DUPLICATE_583d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1822_l1819_l1815_l1812_DUPLICATE_583d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1855_l1798_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_dfbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1855_l1798_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_dfbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1855_l1798_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_dfbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1855_l1798_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_dfbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1855_l1798_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_dfbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1855_l1798_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_dfbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1855_l1798_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_dfbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1855_l1798_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_dfbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1855_l1798_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_dfbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1855_l1798_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_dfbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1855_l1798_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_dfbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1855_l1798_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_dfbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1855_l1798_l1822_l1851_l1819_l1846_l1815_l1842_l1812_DUPLICATE_dfbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1851_l1830_DUPLICATE_62a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1851_l1830_DUPLICATE_62a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1851_l1819_l1815_l1812_DUPLICATE_a5f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1851_l1819_l1815_l1812_DUPLICATE_a5f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1851_l1819_l1815_l1812_DUPLICATE_a5f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1851_l1819_l1815_l1812_DUPLICATE_a5f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1851_l1819_l1815_l1812_DUPLICATE_a5f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1851_l1819_l1815_l1812_DUPLICATE_a5f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1851_l1819_l1815_l1812_DUPLICATE_a5f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1851_l1819_l1815_l1812_DUPLICATE_a5f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1851_l1819_l1815_l1812_DUPLICATE_a5f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1807_l1830_l1804_l1827_l1798_l1822_l1851_l1819_l1815_l1812_DUPLICATE_a5f8_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1853_c24_f147] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1853_c24_f147_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1853_c34_fcb2_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1798_c1_ef1e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1846_c7_829a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1834_c32_fc2f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_left;
     BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_return_output := BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1816_c3_d79c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_left;
     BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_return_output := BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1844_c24_a76b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1844_c24_a76b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1844_c34_14c0_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1855_c7_3c9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1855_c7_3c9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1831_c3_6601] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_left;
     BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_return_output := BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1830_c7_8193] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1851_c7_d076] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1834_c32_1f30_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1834_c32_fc2f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1816_c3_d79c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1831_c3_6601_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1844_c24_a76b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1853_c24_f147_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1824_l1809_DUPLICATE_407e_return_output;
     VAR_printf_uxn_opcodes_h_l1799_c3_23b9_uxn_opcodes_h_l1799_c3_23b9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1798_c1_ef1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_3c9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_829a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_8193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1855_c7_3c9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c7_d076_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1827_c7_046a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1851_c7_d076] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1842_c7_3494] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_return_output;

     -- printf_uxn_opcodes_h_l1799_c3_23b9[uxn_opcodes_h_l1799_c3_23b9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1799_c3_23b9_uxn_opcodes_h_l1799_c3_23b9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1799_c3_23b9_uxn_opcodes_h_l1799_c3_23b9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1851_c7_d076] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_return_output;

     -- n16_MUX[uxn_opcodes_h_l1830_c7_8193] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1830_c7_8193_cond <= VAR_n16_MUX_uxn_opcodes_h_l1830_c7_8193_cond;
     n16_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue;
     n16_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1830_c7_8193_return_output := n16_MUX_uxn_opcodes_h_l1830_c7_8193_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1846_c7_829a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1851_c7_d076] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_return_output := result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_return_output;

     -- t16_MUX[uxn_opcodes_h_l1815_c7_2b72] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1815_c7_2b72_cond <= VAR_t16_MUX_uxn_opcodes_h_l1815_c7_2b72_cond;
     t16_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue;
     t16_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output := t16_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;

     -- MUX[uxn_opcodes_h_l1834_c32_1f30] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1834_c32_1f30_cond <= VAR_MUX_uxn_opcodes_h_l1834_c32_1f30_cond;
     MUX_uxn_opcodes_h_l1834_c32_1f30_iftrue <= VAR_MUX_uxn_opcodes_h_l1834_c32_1f30_iftrue;
     MUX_uxn_opcodes_h_l1834_c32_1f30_iffalse <= VAR_MUX_uxn_opcodes_h_l1834_c32_1f30_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1834_c32_1f30_return_output := MUX_uxn_opcodes_h_l1834_c32_1f30_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue := VAR_MUX_uxn_opcodes_h_l1834_c32_1f30_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1830_c7_8193_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_d076_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1842_c7_3494_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1827_c7_046a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1851_c7_d076_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1846_c7_829a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1851_c7_d076_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1842_c7_3494] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1836_c7_4932] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1846_c7_829a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1846_c7_829a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1846_c7_829a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1822_c7_7efe] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1830_c7_8193] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_return_output;

     -- n16_MUX[uxn_opcodes_h_l1827_c7_046a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1827_c7_046a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1827_c7_046a_cond;
     n16_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue;
     n16_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1827_c7_046a_return_output := n16_MUX_uxn_opcodes_h_l1827_c7_046a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1812_c7_ba69] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1812_c7_ba69_cond <= VAR_t16_MUX_uxn_opcodes_h_l1812_c7_ba69_cond;
     t16_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue;
     t16_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output := t16_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1827_c7_046a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_829a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_4932_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1846_c7_829a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_8193_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1842_c7_3494_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1846_c7_829a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;
     -- t16_MUX[uxn_opcodes_h_l1807_c7_5825] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1807_c7_5825_cond <= VAR_t16_MUX_uxn_opcodes_h_l1807_c7_5825_cond;
     t16_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue;
     t16_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1807_c7_5825_return_output := t16_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1827_c7_046a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1836_c7_4932] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_return_output;

     -- n16_MUX[uxn_opcodes_h_l1822_c7_7efe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1822_c7_7efe_cond <= VAR_n16_MUX_uxn_opcodes_h_l1822_c7_7efe_cond;
     n16_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue;
     n16_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output := n16_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1830_c7_8193] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1842_c7_3494] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1842_c7_3494] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_return_output := result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1819_c7_c32b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1842_c7_3494] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1842_c7_3494_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_8193_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1842_c7_3494_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_046a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1836_c7_4932_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1842_c7_3494_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1836_c7_4932] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1815_c7_2b72] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1830_c7_8193] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1836_c7_4932] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_return_output;

     -- n16_MUX[uxn_opcodes_h_l1819_c7_c32b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1819_c7_c32b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1819_c7_c32b_cond;
     n16_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue;
     n16_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output := n16_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1804_c7_0aca] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1804_c7_0aca_cond <= VAR_t16_MUX_uxn_opcodes_h_l1804_c7_0aca_cond;
     t16_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue;
     t16_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output := t16_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1836_c7_4932] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_return_output := result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1827_c7_046a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1822_c7_7efe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_4932_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_046a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1836_c7_4932_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_8193_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1836_c7_4932_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1827_c7_046a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1830_c7_8193] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1812_c7_ba69] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1830_c7_8193] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1819_c7_c32b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1822_c7_7efe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1830_c7_8193] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_return_output := result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_return_output;

     -- n16_MUX[uxn_opcodes_h_l1815_c7_2b72] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1815_c7_2b72_cond <= VAR_n16_MUX_uxn_opcodes_h_l1815_c7_2b72_cond;
     n16_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue;
     n16_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output := n16_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;

     -- t16_MUX[uxn_opcodes_h_l1798_c2_9fd5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond;
     t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue;
     t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output := t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_8193_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_8193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_046a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_8193_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1827_c7_046a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1827_c7_046a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1807_c7_5825] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1819_c7_c32b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1815_c7_2b72] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1822_c7_7efe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1827_c7_046a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1812_c7_ba69] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1812_c7_ba69_cond <= VAR_n16_MUX_uxn_opcodes_h_l1812_c7_ba69_cond;
     n16_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue;
     n16_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output := n16_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_046a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1827_c7_046a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1827_c7_046a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1822_c7_7efe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1819_c7_c32b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1822_c7_7efe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1812_c7_ba69] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;

     -- n16_MUX[uxn_opcodes_h_l1807_c7_5825] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1807_c7_5825_cond <= VAR_n16_MUX_uxn_opcodes_h_l1807_c7_5825_cond;
     n16_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue;
     n16_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1807_c7_5825_return_output := n16_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1815_c7_2b72] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1822_c7_7efe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output := result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1804_c7_0aca] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_7efe_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1815_c7_2b72] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1819_c7_c32b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1804_c7_0aca] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1804_c7_0aca_cond <= VAR_n16_MUX_uxn_opcodes_h_l1804_c7_0aca_cond;
     n16_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue;
     n16_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output := n16_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1807_c7_5825] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1812_c7_ba69] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1819_c7_c32b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1819_c7_c32b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1798_c2_9fd5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_c32b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c7_ba69] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1815_c7_2b72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1815_c7_2b72] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output := result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1807_c7_5825] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;

     -- n16_MUX[uxn_opcodes_h_l1798_c2_9fd5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond;
     n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue;
     n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output := n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1804_c7_0aca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1815_c7_2b72] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_2b72_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c7_ba69] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1804_c7_0aca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1812_c7_ba69] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1807_c7_5825] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1812_c7_ba69] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output := result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1798_c2_9fd5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c7_ba69_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1807_c7_5825] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1798_c2_9fd5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1804_c7_0aca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1807_c7_5825] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1807_c7_5825] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_return_output := result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1807_c7_5825_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1804_c7_0aca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1798_c2_9fd5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1804_c7_0aca] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output := result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1804_c7_0aca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1804_c7_0aca_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1798_c2_9fd5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1798_c2_9fd5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1798_c2_9fd5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output;

     -- Submodule level 15
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1860_l1794_DUPLICATE_3490 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1860_l1794_DUPLICATE_3490_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1798_c2_9fd5_return_output);

     -- Submodule level 16
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1860_l1794_DUPLICATE_3490_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1860_l1794_DUPLICATE_3490_return_output;
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
