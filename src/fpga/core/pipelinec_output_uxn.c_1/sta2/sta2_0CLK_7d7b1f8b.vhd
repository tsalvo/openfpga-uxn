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
-- BIN_OP_EQ[uxn_opcodes_h_l2205_c6_4af7]
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2205_c1_36cc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2205_c2_217f]
signal n16_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2205_c2_217f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2205_c2_217f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2205_c2_217f]
signal result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2205_c2_217f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2205_c2_217f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2205_c2_217f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2205_c2_217f]
signal result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2205_c2_217f]
signal t16_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2206_c3_fde5[uxn_opcodes_h_l2206_c3_fde5]
signal printf_uxn_opcodes_h_l2206_c3_fde5_uxn_opcodes_h_l2206_c3_fde5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2210_c11_ac37]
signal BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2210_c7_0669]
signal n16_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2210_c7_0669]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2210_c7_0669]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2210_c7_0669]
signal result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2210_c7_0669]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2210_c7_0669]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2210_c7_0669]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2210_c7_0669]
signal result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2210_c7_0669]
signal t16_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2213_c11_f106]
signal BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2213_c7_8c09]
signal n16_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2213_c7_8c09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2213_c7_8c09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2213_c7_8c09]
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2213_c7_8c09]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2213_c7_8c09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2213_c7_8c09]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2213_c7_8c09]
signal result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2213_c7_8c09]
signal t16_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2218_c11_3db2]
signal BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2218_c7_1826]
signal n16_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2218_c7_1826]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2218_c7_1826]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2218_c7_1826]
signal result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2218_c7_1826]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2218_c7_1826]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2218_c7_1826]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2218_c7_1826]
signal result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2218_c7_1826]
signal t16_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2219_c3_1e4e]
signal BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2222_c11_4366]
signal BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2222_c7_b644]
signal n16_MUX_uxn_opcodes_h_l2222_c7_b644_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2222_c7_b644_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2222_c7_b644]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2222_c7_b644]
signal result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2222_c7_b644]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2222_c7_b644]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2222_c7_b644]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2222_c7_b644]
signal result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2226_c11_a1d7]
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2226_c7_99bb]
signal n16_MUX_uxn_opcodes_h_l2226_c7_99bb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2226_c7_99bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2226_c7_99bb]
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2226_c7_99bb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2226_c7_99bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2226_c7_99bb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2226_c7_99bb]
signal result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2227_c3_0ded]
signal BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2229_c30_0bb6]
signal sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2232_c31_30c8]
signal CONST_SR_8_uxn_opcodes_h_l2232_c31_30c8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2232_c31_30c8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2234_c11_9bee]
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2234_c7_ef05]
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2234_c7_ef05]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2234_c7_ef05]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2234_c7_ef05]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2234_c7_ef05]
signal result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2236_c22_91c5]
signal BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2239_c11_8f81]
signal BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2239_c7_94d8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2239_c7_94d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_18d1( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.u16_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7
BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_left,
BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_right,
BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_return_output);

-- n16_MUX_uxn_opcodes_h_l2205_c2_217f
n16_MUX_uxn_opcodes_h_l2205_c2_217f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2205_c2_217f_cond,
n16_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue,
n16_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse,
n16_MUX_uxn_opcodes_h_l2205_c2_217f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f
result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f
result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f
result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_cond,
result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_return_output);

-- t16_MUX_uxn_opcodes_h_l2205_c2_217f
t16_MUX_uxn_opcodes_h_l2205_c2_217f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2205_c2_217f_cond,
t16_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue,
t16_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse,
t16_MUX_uxn_opcodes_h_l2205_c2_217f_return_output);

-- printf_uxn_opcodes_h_l2206_c3_fde5_uxn_opcodes_h_l2206_c3_fde5
printf_uxn_opcodes_h_l2206_c3_fde5_uxn_opcodes_h_l2206_c3_fde5 : entity work.printf_uxn_opcodes_h_l2206_c3_fde5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2206_c3_fde5_uxn_opcodes_h_l2206_c3_fde5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37
BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_left,
BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_right,
BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_return_output);

-- n16_MUX_uxn_opcodes_h_l2210_c7_0669
n16_MUX_uxn_opcodes_h_l2210_c7_0669 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2210_c7_0669_cond,
n16_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue,
n16_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse,
n16_MUX_uxn_opcodes_h_l2210_c7_0669_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669
result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669
result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_cond,
result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669
result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669
result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669
result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669
result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_cond,
result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_return_output);

-- t16_MUX_uxn_opcodes_h_l2210_c7_0669
t16_MUX_uxn_opcodes_h_l2210_c7_0669 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2210_c7_0669_cond,
t16_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue,
t16_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse,
t16_MUX_uxn_opcodes_h_l2210_c7_0669_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106
BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_left,
BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_right,
BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_return_output);

-- n16_MUX_uxn_opcodes_h_l2213_c7_8c09
n16_MUX_uxn_opcodes_h_l2213_c7_8c09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2213_c7_8c09_cond,
n16_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue,
n16_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse,
n16_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09
result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_cond,
result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09
result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_cond,
result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output);

-- t16_MUX_uxn_opcodes_h_l2213_c7_8c09
t16_MUX_uxn_opcodes_h_l2213_c7_8c09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2213_c7_8c09_cond,
t16_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue,
t16_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse,
t16_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_left,
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_right,
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_return_output);

-- n16_MUX_uxn_opcodes_h_l2218_c7_1826
n16_MUX_uxn_opcodes_h_l2218_c7_1826 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2218_c7_1826_cond,
n16_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue,
n16_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse,
n16_MUX_uxn_opcodes_h_l2218_c7_1826_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_cond,
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_cond,
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_return_output);

-- t16_MUX_uxn_opcodes_h_l2218_c7_1826
t16_MUX_uxn_opcodes_h_l2218_c7_1826 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2218_c7_1826_cond,
t16_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue,
t16_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse,
t16_MUX_uxn_opcodes_h_l2218_c7_1826_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e
BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_left,
BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_right,
BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366
BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_left,
BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_right,
BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_return_output);

-- n16_MUX_uxn_opcodes_h_l2222_c7_b644
n16_MUX_uxn_opcodes_h_l2222_c7_b644 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2222_c7_b644_cond,
n16_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue,
n16_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse,
n16_MUX_uxn_opcodes_h_l2222_c7_b644_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644
result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644
result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_cond,
result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644
result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644
result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644
result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644
result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_cond,
result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_left,
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_right,
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_return_output);

-- n16_MUX_uxn_opcodes_h_l2226_c7_99bb
n16_MUX_uxn_opcodes_h_l2226_c7_99bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2226_c7_99bb_cond,
n16_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue,
n16_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse,
n16_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_cond,
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded
BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_left,
BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_right,
BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6
sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_ins,
sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_x,
sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_y,
sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2232_c31_30c8
CONST_SR_8_uxn_opcodes_h_l2232_c31_30c8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2232_c31_30c8_x,
CONST_SR_8_uxn_opcodes_h_l2232_c31_30c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_left,
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_right,
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_cond,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_cond,
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5
BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_left,
BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_right,
BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81
BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_left,
BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_right,
BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8
result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8
result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003
CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_return_output,
 n16_MUX_uxn_opcodes_h_l2205_c2_217f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_return_output,
 t16_MUX_uxn_opcodes_h_l2205_c2_217f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_return_output,
 n16_MUX_uxn_opcodes_h_l2210_c7_0669_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_return_output,
 t16_MUX_uxn_opcodes_h_l2210_c7_0669_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_return_output,
 n16_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output,
 t16_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_return_output,
 n16_MUX_uxn_opcodes_h_l2218_c7_1826_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_return_output,
 t16_MUX_uxn_opcodes_h_l2218_c7_1826_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_return_output,
 n16_MUX_uxn_opcodes_h_l2222_c7_b644_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_return_output,
 n16_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_return_output,
 sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_return_output,
 CONST_SR_8_uxn_opcodes_h_l2232_c31_30c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2207_c3_26c8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2210_c7_0669_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2205_c2_217f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2205_c2_217f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2206_c3_fde5_uxn_opcodes_h_l2206_c3_fde5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2211_c3_0cc2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2210_c7_0669_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2216_c3_7dad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2218_c7_1826_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2213_c7_8c09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2222_c7_b644_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2220_c3_a29e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2218_c7_1826_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2218_c7_1826_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2222_c7_b644_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_99bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2232_c31_30c8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2232_c31_30c8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2232_c21_af08_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2236_c3_d55a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2237_c21_4cf3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2226_DUPLICATE_9918_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_853e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2205_l2234_DUPLICATE_d5ae_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_3781_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_7625_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2234_l2226_DUPLICATE_db9a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2214_l2227_l2219_l2223_DUPLICATE_406a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l2201_l2244_DUPLICATE_7047_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2220_c3_a29e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2220_c3_a29e;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2216_c3_7dad := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2216_c3_7dad;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2207_c3_26c8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2207_c3_26c8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_y := to_signed(-4, 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_right := to_unsigned(6, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2211_c3_0cc2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2211_c3_0cc2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2210_c11_ac37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_left;
     BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_return_output := BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2239_c11_8f81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_left;
     BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_return_output := BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2226_c11_a1d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2234_c11_9bee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2226_DUPLICATE_9918 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2226_DUPLICATE_9918_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_7625 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_7625_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2213_c11_f106] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_left;
     BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_return_output := BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2229_c30_0bb6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_ins;
     sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_x;
     sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_return_output := sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_853e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_853e_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2218_c11_3db2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_3781 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_3781_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2237_c21_4cf3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2237_c21_4cf3_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2205_c6_4af7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2205_l2234_DUPLICATE_d5ae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2205_l2234_DUPLICATE_d5ae_return_output := result.is_ram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2236_c22_91c5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2214_l2227_l2219_l2223_DUPLICATE_406a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2214_l2227_l2219_l2223_DUPLICATE_406a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2234_l2226_DUPLICATE_db9a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2234_l2226_DUPLICATE_db9a_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2218_c7_1826] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2218_c7_1826_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2222_c11_4366] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_left;
     BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_return_output := BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2205_c2_217f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2205_c2_217f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c6_4af7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2210_c7_0669_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2210_c7_0669_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2210_c11_ac37_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2213_c7_8c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2213_c7_8c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c11_f106_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2218_c7_1826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2218_c7_1826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_3db2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2222_c7_b644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_4366_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_99bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_a1d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_9bee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2239_c11_8f81_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2236_c3_d55a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2236_c22_91c5_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2214_l2227_l2219_l2223_DUPLICATE_406a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2214_l2227_l2219_l2223_DUPLICATE_406a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2214_l2227_l2219_l2223_DUPLICATE_406a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2237_c21_4cf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2226_DUPLICATE_9918_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2226_DUPLICATE_9918_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2226_DUPLICATE_9918_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2226_DUPLICATE_9918_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2226_DUPLICATE_9918_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2226_DUPLICATE_9918_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_7625_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_7625_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_7625_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_7625_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_7625_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_7625_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2234_l2226_DUPLICATE_db9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2234_l2226_DUPLICATE_db9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2234_l2226_DUPLICATE_db9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2234_l2226_DUPLICATE_db9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2234_l2226_DUPLICATE_db9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2234_l2226_DUPLICATE_db9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2234_l2226_DUPLICATE_db9a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2205_l2234_DUPLICATE_d5ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2205_l2234_DUPLICATE_d5ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2205_l2234_DUPLICATE_d5ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2205_l2234_DUPLICATE_d5ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2205_l2234_DUPLICATE_d5ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2205_l2234_DUPLICATE_d5ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2239_l2205_l2234_DUPLICATE_d5ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_3781_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_3781_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_3781_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_3781_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_3781_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_3781_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_853e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_853e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_853e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_853e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_853e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2222_l2218_l2213_l2210_l2205_l2234_DUPLICATE_853e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2218_c7_1826_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2229_c30_0bb6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2236_c3_d55a;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2239_c7_94d8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2218_c7_1826] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2239_c7_94d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2234_c7_ef05] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output := result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2234_c7_ef05] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2226_c7_99bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2234_c7_ef05] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output := result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2219_c3_1e4e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_left;
     BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_return_output := BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2227_c3_0ded] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_left;
     BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_return_output := BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2205_c1_36cc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2219_c3_1e4e_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l2232_c31_30c8_x := VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_0ded_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2215_DUPLICATE_0003_return_output;
     VAR_printf_uxn_opcodes_h_l2206_c3_fde5_uxn_opcodes_h_l2206_c3_fde5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2205_c1_36cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2239_c7_94d8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2239_c7_94d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2234_c7_ef05] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2226_c7_99bb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2226_c7_99bb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output := result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2232_c31_30c8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2232_c31_30c8_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2232_c31_30c8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2232_c31_30c8_return_output := CONST_SR_8_uxn_opcodes_h_l2232_c31_30c8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2226_c7_99bb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2226_c7_99bb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_99bb_cond;
     n16_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue;
     n16_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output := n16_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2213_c7_8c09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;

     -- printf_uxn_opcodes_h_l2206_c3_fde5[uxn_opcodes_h_l2206_c3_fde5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2206_c3_fde5_uxn_opcodes_h_l2206_c3_fde5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2206_c3_fde5_uxn_opcodes_h_l2206_c3_fde5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2234_c7_ef05] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2222_c7_b644] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_return_output;

     -- t16_MUX[uxn_opcodes_h_l2218_c7_1826] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2218_c7_1826_cond <= VAR_t16_MUX_uxn_opcodes_h_l2218_c7_1826_cond;
     t16_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue;
     t16_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2218_c7_1826_return_output := t16_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_ef05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_b644_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2222_c7_b644] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_return_output := result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2218_c7_1826] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2226_c7_99bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2210_c7_0669] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2222_c7_b644] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2226_c7_99bb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2232_c21_af08] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2232_c21_af08_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2232_c31_30c8_return_output);

     -- t16_MUX[uxn_opcodes_h_l2213_c7_8c09] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2213_c7_8c09_cond <= VAR_t16_MUX_uxn_opcodes_h_l2213_c7_8c09_cond;
     t16_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue;
     t16_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output := t16_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;

     -- n16_MUX[uxn_opcodes_h_l2222_c7_b644] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2222_c7_b644_cond <= VAR_n16_MUX_uxn_opcodes_h_l2222_c7_b644_cond;
     n16_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue;
     n16_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2222_c7_b644_return_output := n16_MUX_uxn_opcodes_h_l2222_c7_b644_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2232_c21_af08_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2222_c7_b644_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_b644_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_b644_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;
     -- t16_MUX[uxn_opcodes_h_l2210_c7_0669] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2210_c7_0669_cond <= VAR_t16_MUX_uxn_opcodes_h_l2210_c7_0669_cond;
     t16_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue;
     t16_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2210_c7_0669_return_output := t16_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2213_c7_8c09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2218_c7_1826] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_return_output := result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2222_c7_b644] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2205_c2_217f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2218_c7_1826] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2218_c7_1826_cond <= VAR_n16_MUX_uxn_opcodes_h_l2218_c7_1826_cond;
     n16_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue;
     n16_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2218_c7_1826_return_output := n16_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2222_c7_b644] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2226_c7_99bb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2218_c7_1826] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_b644_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_b644_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_99bb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2210_c7_0669] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;

     -- t16_MUX[uxn_opcodes_h_l2205_c2_217f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2205_c2_217f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2205_c2_217f_cond;
     t16_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue;
     t16_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2205_c2_217f_return_output := t16_MUX_uxn_opcodes_h_l2205_c2_217f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2213_c7_8c09] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2213_c7_8c09_cond <= VAR_n16_MUX_uxn_opcodes_h_l2213_c7_8c09_cond;
     n16_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue;
     n16_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output := n16_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2213_c7_8c09] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2218_c7_1826] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2213_c7_8c09] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output := result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2218_c7_1826] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2222_c7_b644] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_return_output := result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_b644_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2205_c2_217f_return_output;
     -- n16_MUX[uxn_opcodes_h_l2210_c7_0669] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2210_c7_0669_cond <= VAR_n16_MUX_uxn_opcodes_h_l2210_c7_0669_cond;
     n16_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue;
     n16_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2210_c7_0669_return_output := n16_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2218_c7_1826] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_return_output := result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2213_c7_8c09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2210_c7_0669] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_return_output := result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2210_c7_0669] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2213_c7_8c09] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2205_c2_217f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_1826_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2210_c7_0669] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2210_c7_0669] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2205_c2_217f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2205_c2_217f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_return_output := result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2213_c7_8c09] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output := result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;

     -- n16_MUX[uxn_opcodes_h_l2205_c2_217f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2205_c2_217f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2205_c2_217f_cond;
     n16_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue;
     n16_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2205_c2_217f_return_output := n16_MUX_uxn_opcodes_h_l2205_c2_217f_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2205_c2_217f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c7_8c09_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2205_c2_217f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2205_c2_217f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2210_c7_0669] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_return_output := result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2210_c7_0669_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2205_c2_217f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l2201_l2244_DUPLICATE_7047 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l2201_l2244_DUPLICATE_7047_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_18d1(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c2_217f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c2_217f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2205_c2_217f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2205_c2_217f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c2_217f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c2_217f_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2205_c2_217f_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l2201_l2244_DUPLICATE_7047_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l2201_l2244_DUPLICATE_7047_return_output;
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
