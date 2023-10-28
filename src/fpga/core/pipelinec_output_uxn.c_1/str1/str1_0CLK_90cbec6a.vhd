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
-- Submodules: 57
entity str1_0CLK_90cbec6a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str1_0CLK_90cbec6a;
architecture arch of str1_0CLK_90cbec6a is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1779_c6_f641]
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1779_c1_dc4b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c2_2eff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1779_c2_2eff]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c2_2eff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c2_2eff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1779_c2_2eff]
signal result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1779_c2_2eff]
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1779_c2_2eff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1779_c2_2eff]
signal t8_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1779_c2_2eff]
signal n8_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1780_c3_ef37[uxn_opcodes_h_l1780_c3_ef37]
signal printf_uxn_opcodes_h_l1780_c3_ef37_uxn_opcodes_h_l1780_c3_ef37_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1784_c11_3a4d]
signal BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1784_c7_6ef5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1784_c7_6ef5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1784_c7_6ef5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1784_c7_6ef5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1784_c7_6ef5]
signal result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1784_c7_6ef5]
signal result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1784_c7_6ef5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1784_c7_6ef5]
signal t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1784_c7_6ef5]
signal n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1787_c11_b742]
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1787_c7_9d21]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1787_c7_9d21]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1787_c7_9d21]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1787_c7_9d21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1787_c7_9d21]
signal result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1787_c7_9d21]
signal result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1787_c7_9d21]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1787_c7_9d21]
signal t8_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1787_c7_9d21]
signal n8_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1791_c11_b994]
signal BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1791_c7_ff48]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1791_c7_ff48]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1791_c7_ff48]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1791_c7_ff48]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1791_c7_ff48]
signal result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1791_c7_ff48]
signal result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1791_c7_ff48]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l1791_c7_ff48]
signal n8_MUX_uxn_opcodes_h_l1791_c7_ff48_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1794_c11_7eb8]
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1794_c7_c377]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1794_c7_c377]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1794_c7_c377]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1794_c7_c377]
signal result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1794_c7_c377]
signal result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1794_c7_c377]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l1794_c7_c377]
signal n8_MUX_uxn_opcodes_h_l1794_c7_c377_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1794_c7_c377_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1797_c30_ae49]
signal sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1799_c22_5f19]
signal BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1802_c11_34e0]
signal BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1802_c7_d051]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1802_c7_d051]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1802_c7_d051]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5abb( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641
BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_left,
BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_right,
BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff
result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff
result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_cond,
result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff
result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_cond,
result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output);

-- t8_MUX_uxn_opcodes_h_l1779_c2_2eff
t8_MUX_uxn_opcodes_h_l1779_c2_2eff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1779_c2_2eff_cond,
t8_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue,
t8_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse,
t8_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output);

-- n8_MUX_uxn_opcodes_h_l1779_c2_2eff
n8_MUX_uxn_opcodes_h_l1779_c2_2eff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1779_c2_2eff_cond,
n8_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue,
n8_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse,
n8_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output);

-- printf_uxn_opcodes_h_l1780_c3_ef37_uxn_opcodes_h_l1780_c3_ef37
printf_uxn_opcodes_h_l1780_c3_ef37_uxn_opcodes_h_l1780_c3_ef37 : entity work.printf_uxn_opcodes_h_l1780_c3_ef37_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1780_c3_ef37_uxn_opcodes_h_l1780_c3_ef37_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d
BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_left,
BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_right,
BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5
result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5
result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5
result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5
result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5
result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output);

-- t8_MUX_uxn_opcodes_h_l1784_c7_6ef5
t8_MUX_uxn_opcodes_h_l1784_c7_6ef5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond,
t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue,
t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse,
t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output);

-- n8_MUX_uxn_opcodes_h_l1784_c7_6ef5
n8_MUX_uxn_opcodes_h_l1784_c7_6ef5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond,
n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue,
n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse,
n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_left,
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_right,
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21
result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21
result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_cond,
result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21
result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_cond,
result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21
result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output);

-- t8_MUX_uxn_opcodes_h_l1787_c7_9d21
t8_MUX_uxn_opcodes_h_l1787_c7_9d21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1787_c7_9d21_cond,
t8_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue,
t8_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse,
t8_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output);

-- n8_MUX_uxn_opcodes_h_l1787_c7_9d21
n8_MUX_uxn_opcodes_h_l1787_c7_9d21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1787_c7_9d21_cond,
n8_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue,
n8_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse,
n8_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_left,
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_right,
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48
result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48
result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48
result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_cond,
result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48
result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_cond,
result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48
result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output);

-- n8_MUX_uxn_opcodes_h_l1791_c7_ff48
n8_MUX_uxn_opcodes_h_l1791_c7_ff48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1791_c7_ff48_cond,
n8_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue,
n8_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse,
n8_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_left,
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_right,
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377
result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377
result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_cond,
result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377
result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_cond,
result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377
result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_return_output);

-- n8_MUX_uxn_opcodes_h_l1794_c7_c377
n8_MUX_uxn_opcodes_h_l1794_c7_c377 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1794_c7_c377_cond,
n8_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue,
n8_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse,
n8_MUX_uxn_opcodes_h_l1794_c7_c377_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49
sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_ins,
sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_x,
sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_y,
sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19
BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_left,
BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_right,
BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0
BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_left,
BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_right,
BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051
result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051
result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output,
 t8_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output,
 n8_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output,
 t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output,
 n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output,
 t8_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output,
 n8_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output,
 n8_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_return_output,
 n8_MUX_uxn_opcodes_h_l1794_c7_c377_return_output,
 sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1781_c3_0503 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1779_c2_2eff_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1780_c3_ef37_uxn_opcodes_h_l1780_c3_ef37_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1785_c3_4891 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1789_c3_a568 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1787_c7_9d21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_317c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1791_c7_ff48_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1794_c7_c377_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1791_c7_ff48_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1799_c3_72e8 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1794_c7_c377_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1799_c27_e796_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1802_l1791_l1787_l1784_l1779_DUPLICATE_2c48_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1802_l1791_l1787_l1784_l1779_DUPLICATE_7be4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_6b14_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_c704_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_22ee_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1802_l1794_l1791_l1787_l1784_DUPLICATE_74e9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1809_l1775_DUPLICATE_5507_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1789_c3_a568 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1789_c3_a568;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1781_c3_0503 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1781_c3_0503;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1785_c3_4891 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1785_c3_4891;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_317c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_317c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_right := to_unsigned(2, 2);

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

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l1797_c30_ae49] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_ins;
     sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_x;
     sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_return_output := sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1787_c11_b742] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_left;
     BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_return_output := BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1802_c11_34e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_6b14 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_6b14_return_output := result.u16_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1791_c7_ff48] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1791_c7_ff48_return_output := result.stack_address_sp_offset;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1799_c27_e796] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1799_c27_e796_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1779_c6_f641] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_left;
     BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_return_output := BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1794_c11_7eb8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1802_l1791_l1787_l1784_l1779_DUPLICATE_2c48 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1802_l1791_l1787_l1784_l1779_DUPLICATE_2c48_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1802_l1794_l1791_l1787_l1784_DUPLICATE_74e9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1802_l1794_l1791_l1787_l1784_DUPLICATE_74e9_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1784_c11_3a4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1791_c11_b994] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_left;
     BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_return_output := BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_22ee LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_22ee_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1802_l1791_l1787_l1784_l1779_DUPLICATE_7be4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1802_l1791_l1787_l1784_l1779_DUPLICATE_7be4_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_c704 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_c704_return_output := result.u8_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1779_c2_2eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1779_c2_2eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c6_f641_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_3a4d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1787_c7_9d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1787_c7_9d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_b742_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1791_c7_ff48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_b994_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1794_c7_c377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_7eb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_34e0_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1799_c27_e796_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_22ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_22ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_22ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_22ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_22ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_6b14_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_6b14_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_6b14_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_6b14_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_6b14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1802_l1794_l1791_l1787_l1784_DUPLICATE_74e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1802_l1794_l1791_l1787_l1784_DUPLICATE_74e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1802_l1794_l1791_l1787_l1784_DUPLICATE_74e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1802_l1794_l1791_l1787_l1784_DUPLICATE_74e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1802_l1794_l1791_l1787_l1784_DUPLICATE_74e9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1802_l1791_l1787_l1784_l1779_DUPLICATE_2c48_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1802_l1791_l1787_l1784_l1779_DUPLICATE_2c48_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1802_l1791_l1787_l1784_l1779_DUPLICATE_2c48_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1802_l1791_l1787_l1784_l1779_DUPLICATE_2c48_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1802_l1791_l1787_l1784_l1779_DUPLICATE_2c48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1802_l1791_l1787_l1784_l1779_DUPLICATE_7be4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1802_l1791_l1787_l1784_l1779_DUPLICATE_7be4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1802_l1791_l1787_l1784_l1779_DUPLICATE_7be4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1802_l1791_l1787_l1784_l1779_DUPLICATE_7be4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1802_l1791_l1787_l1784_l1779_DUPLICATE_7be4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_c704_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_c704_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_c704_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_c704_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1794_l1791_l1787_l1784_l1779_DUPLICATE_c704_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1791_c7_ff48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1797_c30_ae49_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1802_c7_d051] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1802_c7_d051] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_return_output;

     -- n8_MUX[uxn_opcodes_h_l1794_c7_c377] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1794_c7_c377_cond <= VAR_n8_MUX_uxn_opcodes_h_l1794_c7_c377_cond;
     n8_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue;
     n8_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1794_c7_c377_return_output := n8_MUX_uxn_opcodes_h_l1794_c7_c377_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1802_c7_d051] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1791_c7_ff48] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1794_c7_c377] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1794_c7_c377] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_return_output := result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1779_c1_dc4b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_return_output;

     -- t8_MUX[uxn_opcodes_h_l1787_c7_9d21] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1787_c7_9d21_cond <= VAR_t8_MUX_uxn_opcodes_h_l1787_c7_9d21_cond;
     t8_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue;
     t8_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output := t8_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1799_c22_5f19] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1799_c3_72e8 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1799_c22_5f19_return_output)),16);
     VAR_printf_uxn_opcodes_h_l1780_c3_ef37_uxn_opcodes_h_l1780_c3_ef37_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1779_c1_dc4b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1794_c7_c377_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_d051_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_d051_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_d051_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c377_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c377_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1799_c3_72e8;
     -- result_u8_value_MUX[uxn_opcodes_h_l1791_c7_ff48] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output := result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1794_c7_c377] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1794_c7_c377] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1794_c7_c377] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_return_output := result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1787_c7_9d21] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;

     -- n8_MUX[uxn_opcodes_h_l1791_c7_ff48] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1791_c7_ff48_cond <= VAR_n8_MUX_uxn_opcodes_h_l1791_c7_ff48_cond;
     n8_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue;
     n8_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output := n8_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1791_c7_ff48] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output;

     -- printf_uxn_opcodes_h_l1780_c3_ef37[uxn_opcodes_h_l1780_c3_ef37] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1780_c3_ef37_uxn_opcodes_h_l1780_c3_ef37_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1780_c3_ef37_uxn_opcodes_h_l1780_c3_ef37_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l1784_c7_6ef5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond <= VAR_t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond;
     t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue;
     t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output := t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1794_c7_c377] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c377_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1794_c7_c377_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_c377_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c377_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1791_c7_ff48] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1784_c7_6ef5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1791_c7_ff48] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output;

     -- t8_MUX[uxn_opcodes_h_l1779_c2_2eff] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1779_c2_2eff_cond <= VAR_t8_MUX_uxn_opcodes_h_l1779_c2_2eff_cond;
     t8_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue;
     t8_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output := t8_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1791_c7_ff48] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output := result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1791_c7_ff48] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1787_c7_9d21] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output := result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1787_c7_9d21] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;

     -- n8_MUX[uxn_opcodes_h_l1787_c7_9d21] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1787_c7_9d21_cond <= VAR_n8_MUX_uxn_opcodes_h_l1787_c7_9d21_cond;
     n8_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue;
     n8_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output := n8_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_ff48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1787_c7_9d21] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c2_2eff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1787_c7_9d21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1784_c7_6ef5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1784_c7_6ef5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1787_c7_9d21] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;

     -- n8_MUX[uxn_opcodes_h_l1784_c7_6ef5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond <= VAR_n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond;
     n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue;
     n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output := n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1787_c7_9d21] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output := result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1787_c7_9d21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1784_c7_6ef5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1779_c2_2eff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output;

     -- n8_MUX[uxn_opcodes_h_l1779_c2_2eff] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1779_c2_2eff_cond <= VAR_n8_MUX_uxn_opcodes_h_l1779_c2_2eff_cond;
     n8_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue;
     n8_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output := n8_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1784_c7_6ef5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1779_c2_2eff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output := result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1784_c7_6ef5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1784_c7_6ef5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1784_c7_6ef5_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1779_c2_2eff] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output := result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c2_2eff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c2_2eff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1779_c2_2eff] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1809_l1775_DUPLICATE_5507 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1809_l1775_DUPLICATE_5507_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5abb(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c2_2eff_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1809_l1775_DUPLICATE_5507_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1809_l1775_DUPLICATE_5507_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
