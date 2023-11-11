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
-- BIN_OP_EQ[uxn_opcodes_h_l2213_c6_c276]
signal BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2213_c1_d24e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2213_c2_44e3]
signal n16_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2213_c2_44e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2213_c2_44e3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2213_c2_44e3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2213_c2_44e3]
signal result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2213_c2_44e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2213_c2_44e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2213_c2_44e3]
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2213_c2_44e3]
signal t16_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2214_c3_4a2c[uxn_opcodes_h_l2214_c3_4a2c]
signal printf_uxn_opcodes_h_l2214_c3_4a2c_uxn_opcodes_h_l2214_c3_4a2c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2218_c11_1658]
signal BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2218_c7_2a18]
signal n16_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2218_c7_2a18]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2218_c7_2a18]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2218_c7_2a18]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2218_c7_2a18]
signal result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2218_c7_2a18]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2218_c7_2a18]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2218_c7_2a18]
signal result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2218_c7_2a18]
signal t16_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2221_c11_9c4c]
signal BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2221_c7_aeed]
signal n16_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2221_c7_aeed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2221_c7_aeed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2221_c7_aeed]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2221_c7_aeed]
signal result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2221_c7_aeed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2221_c7_aeed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2221_c7_aeed]
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2221_c7_aeed]
signal t16_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2226_c11_2832]
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2226_c7_cb4f]
signal n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2226_c7_cb4f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2226_c7_cb4f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2226_c7_cb4f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2226_c7_cb4f]
signal result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2226_c7_cb4f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2226_c7_cb4f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2226_c7_cb4f]
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2226_c7_cb4f]
signal t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2227_c3_b2c0]
signal BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2230_c11_63c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2230_c7_b151]
signal n16_MUX_uxn_opcodes_h_l2230_c7_b151_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2230_c7_b151_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2230_c7_b151]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2230_c7_b151]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2230_c7_b151]
signal result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2230_c7_b151]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2230_c7_b151]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2230_c7_b151]
signal result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2234_c11_280d]
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2234_c7_4265]
signal n16_MUX_uxn_opcodes_h_l2234_c7_4265_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_4265_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2234_c7_4265]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2234_c7_4265]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2234_c7_4265]
signal result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2234_c7_4265]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2234_c7_4265]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2234_c7_4265]
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2235_c3_9363]
signal BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2237_c30_2bf8]
signal sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2240_c31_27d6]
signal CONST_SR_8_uxn_opcodes_h_l2240_c31_27d6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2240_c31_27d6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2242_c11_e7af]
signal BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2242_c7_bff6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2242_c7_bff6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2242_c7_bff6]
signal result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2242_c7_bff6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2242_c7_bff6]
signal result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2244_c22_a92a]
signal BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2247_c11_a12f]
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2247_c7_bfe7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2247_c7_bfe7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_ed17( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276
BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_left,
BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_right,
BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_return_output);

-- n16_MUX_uxn_opcodes_h_l2213_c2_44e3
n16_MUX_uxn_opcodes_h_l2213_c2_44e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2213_c2_44e3_cond,
n16_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue,
n16_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse,
n16_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3
result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_cond,
result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output);

-- t16_MUX_uxn_opcodes_h_l2213_c2_44e3
t16_MUX_uxn_opcodes_h_l2213_c2_44e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2213_c2_44e3_cond,
t16_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue,
t16_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse,
t16_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output);

-- printf_uxn_opcodes_h_l2214_c3_4a2c_uxn_opcodes_h_l2214_c3_4a2c
printf_uxn_opcodes_h_l2214_c3_4a2c_uxn_opcodes_h_l2214_c3_4a2c : entity work.printf_uxn_opcodes_h_l2214_c3_4a2c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2214_c3_4a2c_uxn_opcodes_h_l2214_c3_4a2c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_left,
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_right,
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_return_output);

-- n16_MUX_uxn_opcodes_h_l2218_c7_2a18
n16_MUX_uxn_opcodes_h_l2218_c7_2a18 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2218_c7_2a18_cond,
n16_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue,
n16_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse,
n16_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_cond,
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_cond,
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output);

-- t16_MUX_uxn_opcodes_h_l2218_c7_2a18
t16_MUX_uxn_opcodes_h_l2218_c7_2a18 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2218_c7_2a18_cond,
t16_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue,
t16_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse,
t16_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c
BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_left,
BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_right,
BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_return_output);

-- n16_MUX_uxn_opcodes_h_l2221_c7_aeed
n16_MUX_uxn_opcodes_h_l2221_c7_aeed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2221_c7_aeed_cond,
n16_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue,
n16_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse,
n16_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed
result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed
result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_cond,
result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed
result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_cond,
result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output);

-- t16_MUX_uxn_opcodes_h_l2221_c7_aeed
t16_MUX_uxn_opcodes_h_l2221_c7_aeed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2221_c7_aeed_cond,
t16_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue,
t16_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse,
t16_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_left,
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_right,
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_return_output);

-- n16_MUX_uxn_opcodes_h_l2226_c7_cb4f
n16_MUX_uxn_opcodes_h_l2226_c7_cb4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond,
n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue,
n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse,
n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond,
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output);

-- t16_MUX_uxn_opcodes_h_l2226_c7_cb4f
t16_MUX_uxn_opcodes_h_l2226_c7_cb4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond,
t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue,
t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse,
t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0
BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_left,
BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_right,
BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9
BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_return_output);

-- n16_MUX_uxn_opcodes_h_l2230_c7_b151
n16_MUX_uxn_opcodes_h_l2230_c7_b151 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2230_c7_b151_cond,
n16_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue,
n16_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse,
n16_MUX_uxn_opcodes_h_l2230_c7_b151_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151
result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151
result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151
result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_cond,
result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151
result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151
result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151
result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_cond,
result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_left,
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_right,
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_return_output);

-- n16_MUX_uxn_opcodes_h_l2234_c7_4265
n16_MUX_uxn_opcodes_h_l2234_c7_4265 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2234_c7_4265_cond,
n16_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue,
n16_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse,
n16_MUX_uxn_opcodes_h_l2234_c7_4265_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_cond,
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_cond,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363
BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_left,
BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_right,
BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8
sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_ins,
sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_x,
sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_y,
sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2240_c31_27d6
CONST_SR_8_uxn_opcodes_h_l2240_c31_27d6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2240_c31_27d6_x,
CONST_SR_8_uxn_opcodes_h_l2240_c31_27d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_left,
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_right,
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6
result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6
result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_cond,
result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a
BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_left,
BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_right,
BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_left,
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_right,
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54
CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_return_output,
 n16_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output,
 t16_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_return_output,
 n16_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output,
 t16_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_return_output,
 n16_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output,
 t16_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_return_output,
 n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output,
 t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_return_output,
 n16_MUX_uxn_opcodes_h_l2230_c7_b151_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_return_output,
 n16_MUX_uxn_opcodes_h_l2234_c7_4265_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_return_output,
 sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_return_output,
 CONST_SR_8_uxn_opcodes_h_l2240_c31_27d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2215_c3_d575 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2213_c2_44e3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2214_c3_4a2c_uxn_opcodes_h_l2214_c3_4a2c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2219_c3_6d26 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2218_c7_2a18_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2224_c3_c902 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c7_aeed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2230_c7_b151_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2228_c3_d87c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2226_c7_cb4f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_4265_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2230_c7_b151_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_4265_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_27d6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_27d6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2240_c21_8d61_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2244_c3_fe53 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2245_c21_b754_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_ca3c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2213_l2242_DUPLICATE_eba6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_68ef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2234_DUPLICATE_1704_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_1a44_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2242_l2234_DUPLICATE_1f66_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2222_l2235_l2227_l2231_DUPLICATE_90ed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l2209_l2252_DUPLICATE_9191_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_iffalse := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2215_c3_d575 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2215_c3_d575;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2219_c3_6d26 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2219_c3_6d26;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2228_c3_d87c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2228_c3_d87c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_y := to_signed(-4, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2224_c3_c902 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2224_c3_c902;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2213_l2242_DUPLICATE_eba6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2213_l2242_DUPLICATE_eba6_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2221_c11_9c4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2237_c30_2bf8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_ins;
     sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_x;
     sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_return_output := sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2226_c11_2832] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_left;
     BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_return_output := BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2230_c11_63c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2242_l2234_DUPLICATE_1f66 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2242_l2234_DUPLICATE_1f66_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2247_c11_a12f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2213_c6_c276] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_left;
     BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_return_output := BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_ca3c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_ca3c_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2245_c21_b754] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2245_c21_b754_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2222_l2235_l2227_l2231_DUPLICATE_90ed LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2222_l2235_l2227_l2231_DUPLICATE_90ed_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_68ef LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_68ef_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2218_c11_1658] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_left;
     BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_return_output := BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_1a44 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_1a44_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2234_c11_280d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2234_DUPLICATE_1704 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2234_DUPLICATE_1704_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2242_c11_e7af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2226_c7_cb4f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2226_c7_cb4f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2244_c22_a92a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2213_c2_44e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2213_c2_44e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_c276_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2218_c7_2a18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2218_c7_2a18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_1658_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2221_c7_aeed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2221_c7_aeed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_9c4c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_2832_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2230_c7_b151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_63c9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_4265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_280d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_e7af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_a12f_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2244_c3_fe53 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_a92a_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2222_l2235_l2227_l2231_DUPLICATE_90ed_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2222_l2235_l2227_l2231_DUPLICATE_90ed_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2222_l2235_l2227_l2231_DUPLICATE_90ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2245_c21_b754_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2234_DUPLICATE_1704_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2234_DUPLICATE_1704_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2234_DUPLICATE_1704_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2234_DUPLICATE_1704_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2234_DUPLICATE_1704_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2234_DUPLICATE_1704_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_68ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_68ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_68ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_68ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_68ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_68ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2242_l2234_DUPLICATE_1f66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2242_l2234_DUPLICATE_1f66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2242_l2234_DUPLICATE_1f66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2242_l2234_DUPLICATE_1f66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2242_l2234_DUPLICATE_1f66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2242_l2234_DUPLICATE_1f66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2242_l2234_DUPLICATE_1f66_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2213_l2242_DUPLICATE_eba6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2213_l2242_DUPLICATE_eba6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2213_l2242_DUPLICATE_eba6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2213_l2242_DUPLICATE_eba6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2213_l2242_DUPLICATE_eba6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2213_l2242_DUPLICATE_eba6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2247_l2213_l2242_DUPLICATE_eba6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_ca3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_ca3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_ca3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_ca3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_ca3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_ca3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_1a44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_1a44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_1a44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_1a44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_1a44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2230_l2226_l2221_l2218_l2213_l2242_DUPLICATE_1a44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2226_c7_cb4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_2bf8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2244_c3_fe53;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2234_c7_4265] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2247_c7_bfe7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2226_c7_cb4f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2242_c7_bff6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output := result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2242_c7_bff6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2235_c3_9363] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_left;
     BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_return_output := BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2242_c7_bff6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2213_c1_d24e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2227_c3_b2c0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_left;
     BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_return_output := BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2247_c7_bfe7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_b2c0_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_27d6_x := VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_9363_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_8e54_return_output;
     VAR_printf_uxn_opcodes_h_l2214_c3_4a2c_uxn_opcodes_h_l2214_c3_4a2c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_d24e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_bfe7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_bfe7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_4265_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2242_c7_bff6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2234_c7_4265] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2240_c31_27d6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2240_c31_27d6_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_27d6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_27d6_return_output := CONST_SR_8_uxn_opcodes_h_l2240_c31_27d6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2234_c7_4265] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2234_c7_4265_cond <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_4265_cond;
     n16_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue;
     n16_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_4265_return_output := n16_MUX_uxn_opcodes_h_l2234_c7_4265_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2234_c7_4265] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_return_output := result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2230_c7_b151] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_return_output;

     -- printf_uxn_opcodes_h_l2214_c3_4a2c[uxn_opcodes_h_l2214_c3_4a2c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2214_c3_4a2c_uxn_opcodes_h_l2214_c3_4a2c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2214_c3_4a2c_uxn_opcodes_h_l2214_c3_4a2c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2242_c7_bff6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2221_c7_aeed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;

     -- t16_MUX[uxn_opcodes_h_l2226_c7_cb4f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond;
     t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue;
     t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output := t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2234_c7_4265_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_bff6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_4265_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_b151_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_4265_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2218_c7_2a18] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2240_c21_8d61] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2240_c21_8d61_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_27d6_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2226_c7_cb4f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2230_c7_b151] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2230_c7_b151_cond <= VAR_n16_MUX_uxn_opcodes_h_l2230_c7_b151_cond;
     n16_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue;
     n16_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2230_c7_b151_return_output := n16_MUX_uxn_opcodes_h_l2230_c7_b151_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2230_c7_b151] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2230_c7_b151] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_return_output := result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2234_c7_4265] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2234_c7_4265] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_return_output;

     -- t16_MUX[uxn_opcodes_h_l2221_c7_aeed] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2221_c7_aeed_cond <= VAR_t16_MUX_uxn_opcodes_h_l2221_c7_aeed_cond;
     t16_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue;
     t16_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output := t16_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2240_c21_8d61_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2230_c7_b151_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_4265_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_4265_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_b151_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_b151_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2226_c7_cb4f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output := result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2218_c7_2a18] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2218_c7_2a18_cond <= VAR_t16_MUX_uxn_opcodes_h_l2218_c7_2a18_cond;
     t16_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue;
     t16_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output := t16_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2234_c7_4265] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_return_output := result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_return_output;

     -- n16_MUX[uxn_opcodes_h_l2226_c7_cb4f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond;
     n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue;
     n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output := n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2213_c2_44e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2221_c7_aeed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2230_c7_b151] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2230_c7_b151] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2226_c7_cb4f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_b151_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_b151_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_4265_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2218_c7_2a18] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;

     -- n16_MUX[uxn_opcodes_h_l2221_c7_aeed] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2221_c7_aeed_cond <= VAR_n16_MUX_uxn_opcodes_h_l2221_c7_aeed_cond;
     n16_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue;
     n16_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output := n16_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2226_c7_cb4f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2230_c7_b151] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_return_output := result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_return_output;

     -- t16_MUX[uxn_opcodes_h_l2213_c2_44e3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2213_c2_44e3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2213_c2_44e3_cond;
     t16_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue;
     t16_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output := t16_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2221_c7_aeed] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output := result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2226_c7_cb4f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2221_c7_aeed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_b151_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2213_c2_44e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2221_c7_aeed] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2218_c7_2a18] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output := result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;

     -- n16_MUX[uxn_opcodes_h_l2218_c7_2a18] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2218_c7_2a18_cond <= VAR_n16_MUX_uxn_opcodes_h_l2218_c7_2a18_cond;
     n16_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue;
     n16_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output := n16_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2218_c7_2a18] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2221_c7_aeed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2226_c7_cb4f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_cb4f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2213_c2_44e3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2213_c2_44e3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2213_c2_44e3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2213_c2_44e3_cond;
     n16_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue;
     n16_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output := n16_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2213_c2_44e3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output := result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2221_c7_aeed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output := result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2218_c7_2a18] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2218_c7_2a18] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_aeed_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2218_c7_2a18] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output := result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2213_c2_44e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2213_c2_44e3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_2a18_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2213_c2_44e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l2209_l2252_DUPLICATE_9191 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l2209_l2252_DUPLICATE_9191_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ed17(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_44e3_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l2209_l2252_DUPLICATE_9191_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l2209_l2252_DUPLICATE_9191_return_output;
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
