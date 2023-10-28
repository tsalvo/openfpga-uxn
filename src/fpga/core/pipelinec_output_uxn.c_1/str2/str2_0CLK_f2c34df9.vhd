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
-- Submodules: 87
entity str2_0CLK_f2c34df9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str2_0CLK_f2c34df9;
architecture arch of str2_0CLK_f2c34df9 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1817_c6_8e25]
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1817_c1_d460]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1817_c2_63f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1817_c2_63f3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1817_c2_63f3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1817_c2_63f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1817_c2_63f3]
signal result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1817_c2_63f3]
signal result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1817_c2_63f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1817_c2_63f3]
signal n16_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1817_c2_63f3]
signal t8_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1818_c3_52d9[uxn_opcodes_h_l1818_c3_52d9]
signal printf_uxn_opcodes_h_l1818_c3_52d9_uxn_opcodes_h_l1818_c3_52d9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1822_c11_e45d]
signal BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1822_c7_01ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1822_c7_01ed]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1822_c7_01ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1822_c7_01ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1822_c7_01ed]
signal result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1822_c7_01ed]
signal result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1822_c7_01ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1822_c7_01ed]
signal n16_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1822_c7_01ed]
signal t8_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1825_c11_f7ab]
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1825_c7_b4f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1825_c7_b4f4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1825_c7_b4f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1825_c7_b4f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1825_c7_b4f4]
signal result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1825_c7_b4f4]
signal result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1825_c7_b4f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1825_c7_b4f4]
signal n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1825_c7_b4f4]
signal t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1829_c11_1a9f]
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1829_c7_ba9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1829_c7_ba9f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1829_c7_ba9f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1829_c7_ba9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1829_c7_ba9f]
signal result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1829_c7_ba9f]
signal result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1829_c7_ba9f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1829_c7_ba9f]
signal n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1832_c11_41e6]
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1832_c7_245f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1832_c7_245f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c7_245f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c7_245f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1832_c7_245f]
signal result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1832_c7_245f]
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1832_c7_245f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1832_c7_245f]
signal n16_MUX_uxn_opcodes_h_l1832_c7_245f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c7_245f_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1834_c3_ee66]
signal CONST_SL_8_uxn_opcodes_h_l1834_c3_ee66_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1834_c3_ee66_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1837_c11_a25b]
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1837_c7_fc60]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1837_c7_fc60]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1837_c7_fc60]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1837_c7_fc60]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1837_c7_fc60]
signal result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1837_c7_fc60]
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1837_c7_fc60]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1837_c7_fc60]
signal n16_MUX_uxn_opcodes_h_l1837_c7_fc60_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1840_c11_2bca]
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1840_c7_7bd3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1840_c7_7bd3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1840_c7_7bd3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1840_c7_7bd3]
signal result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1840_c7_7bd3]
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1840_c7_7bd3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1840_c7_7bd3]
signal n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1841_c3_a8f4]
signal BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1843_c30_4add]
signal sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1846_c31_769f]
signal CONST_SR_8_uxn_opcodes_h_l1846_c31_769f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1846_c31_769f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1848_c11_588f]
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1848_c7_17fe]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1848_c7_17fe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1848_c7_17fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1848_c7_17fe]
signal result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1848_c7_17fe]
signal result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1850_c22_36cb]
signal BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1853_c11_ec4f]
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1853_c7_0203]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c7_0203]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_return_output : signed(17 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25
BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_left,
BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_right,
BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3
result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3
result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output);

-- n16_MUX_uxn_opcodes_h_l1817_c2_63f3
n16_MUX_uxn_opcodes_h_l1817_c2_63f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1817_c2_63f3_cond,
n16_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue,
n16_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse,
n16_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output);

-- t8_MUX_uxn_opcodes_h_l1817_c2_63f3
t8_MUX_uxn_opcodes_h_l1817_c2_63f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1817_c2_63f3_cond,
t8_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue,
t8_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse,
t8_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output);

-- printf_uxn_opcodes_h_l1818_c3_52d9_uxn_opcodes_h_l1818_c3_52d9
printf_uxn_opcodes_h_l1818_c3_52d9_uxn_opcodes_h_l1818_c3_52d9 : entity work.printf_uxn_opcodes_h_l1818_c3_52d9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1818_c3_52d9_uxn_opcodes_h_l1818_c3_52d9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d
BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_left,
BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_right,
BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed
result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed
result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed
result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed
result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_cond,
result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed
result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_cond,
result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output);

-- n16_MUX_uxn_opcodes_h_l1822_c7_01ed
n16_MUX_uxn_opcodes_h_l1822_c7_01ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1822_c7_01ed_cond,
n16_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue,
n16_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse,
n16_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output);

-- t8_MUX_uxn_opcodes_h_l1822_c7_01ed
t8_MUX_uxn_opcodes_h_l1822_c7_01ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1822_c7_01ed_cond,
t8_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue,
t8_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse,
t8_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_left,
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_right,
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4
result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4
result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4
result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output);

-- n16_MUX_uxn_opcodes_h_l1825_c7_b4f4
n16_MUX_uxn_opcodes_h_l1825_c7_b4f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond,
n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue,
n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse,
n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output);

-- t8_MUX_uxn_opcodes_h_l1825_c7_b4f4
t8_MUX_uxn_opcodes_h_l1825_c7_b4f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond,
t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue,
t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse,
t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_left,
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_right,
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f
result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f
result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f
result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output);

-- n16_MUX_uxn_opcodes_h_l1829_c7_ba9f
n16_MUX_uxn_opcodes_h_l1829_c7_ba9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond,
n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue,
n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse,
n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_left,
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_right,
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f
result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_return_output);

-- n16_MUX_uxn_opcodes_h_l1832_c7_245f
n16_MUX_uxn_opcodes_h_l1832_c7_245f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1832_c7_245f_cond,
n16_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue,
n16_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse,
n16_MUX_uxn_opcodes_h_l1832_c7_245f_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1834_c3_ee66
CONST_SL_8_uxn_opcodes_h_l1834_c3_ee66 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1834_c3_ee66_x,
CONST_SL_8_uxn_opcodes_h_l1834_c3_ee66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_left,
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_right,
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60
result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60
result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_cond,
result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_cond,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output);

-- n16_MUX_uxn_opcodes_h_l1837_c7_fc60
n16_MUX_uxn_opcodes_h_l1837_c7_fc60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1837_c7_fc60_cond,
n16_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue,
n16_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse,
n16_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_left,
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_right,
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3
result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3
result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output);

-- n16_MUX_uxn_opcodes_h_l1840_c7_7bd3
n16_MUX_uxn_opcodes_h_l1840_c7_7bd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond,
n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue,
n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse,
n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4
BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_left,
BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_right,
BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1843_c30_4add
sp_relative_shift_uxn_opcodes_h_l1843_c30_4add : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_ins,
sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_x,
sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_y,
sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1846_c31_769f
CONST_SR_8_uxn_opcodes_h_l1846_c31_769f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1846_c31_769f_x,
CONST_SR_8_uxn_opcodes_h_l1846_c31_769f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_left,
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_right,
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe
result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe
result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_cond,
result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe
result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_cond,
result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb
BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_left,
BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_right,
BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_left,
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_right,
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203
result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_return_output);



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
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output,
 n16_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output,
 t8_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output,
 n16_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output,
 t8_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output,
 n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output,
 t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output,
 n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_return_output,
 n16_MUX_uxn_opcodes_h_l1832_c7_245f_return_output,
 CONST_SL_8_uxn_opcodes_h_l1834_c3_ee66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output,
 n16_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output,
 n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_return_output,
 sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_return_output,
 CONST_SR_8_uxn_opcodes_h_l1846_c31_769f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1819_c3_6c93 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1817_c2_63f3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1818_c3_52d9_uxn_opcodes_h_l1818_c3_52d9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1823_c3_8e14 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1822_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1827_c3_e56e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1830_c3_52a2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c7_245f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1835_c3_2396 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c7_245f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1834_c3_ee66_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1834_c3_ee66_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_50bd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1837_c7_fc60_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_fc60_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1845_c3_f5e1 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1846_c31_769f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1846_c31_769f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1846_c21_c6c5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1850_c3_e865 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_return_output : signed(18 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1851_c21_933b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_bbbf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_af0f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_33fa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_53c7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1825_l1822_l1817_l1840_l1837_l1832_l1829_DUPLICATE_0801_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1840_l1837_l1832_l1829_DUPLICATE_4c64_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1841_l1833_DUPLICATE_4816_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1850_l1845_DUPLICATE_cf99_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1858_l1812_DUPLICATE_e63d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_50bd := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_50bd;
     VAR_sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1819_c3_6c93 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1819_c3_6c93;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1823_c3_8e14 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1823_c3_8e14;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1835_c3_2396 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1835_c3_2396;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1830_c3_52a2 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1830_c3_52a2;
     VAR_sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1827_c3_e56e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1827_c3_e56e;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse := n16;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1829_c11_1a9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1837_c11_a25b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1837_c7_fc60] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1837_c7_fc60_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1825_c11_f7ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_return_output;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1850_l1845_DUPLICATE_cf99 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1850_l1845_DUPLICATE_cf99_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1851_c21_933b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1851_c21_933b_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1848_c11_588f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_bbbf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_bbbf_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1841_l1833_DUPLICATE_4816 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1841_l1833_DUPLICATE_4816_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1825_l1822_l1817_l1840_l1837_l1832_l1829_DUPLICATE_0801 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1825_l1822_l1817_l1840_l1837_l1832_l1829_DUPLICATE_0801_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1832_c11_41e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_af0f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_af0f_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_33fa LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_33fa_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l1843_c30_4add] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_ins;
     sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_x;
     sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_return_output := sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1853_c11_ec4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1840_c11_2bca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1817_c6_8e25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_left;
     BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_return_output := BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_53c7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_53c7_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1840_l1837_l1832_l1829_DUPLICATE_4c64 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1840_l1837_l1832_l1829_DUPLICATE_4c64_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1822_c11_e45d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1817_c2_63f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1817_c2_63f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_8e25_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1822_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1822_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_e45d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_f7ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_1a9f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1832_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_41e6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_fc60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_a25b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_2bca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_588f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_ec4f_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1850_l1845_DUPLICATE_cf99_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1841_l1833_DUPLICATE_4816_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1834_c3_ee66_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1841_l1833_DUPLICATE_4816_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1851_c21_933b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1825_l1822_l1817_l1840_l1837_l1832_l1829_DUPLICATE_0801_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1825_l1822_l1817_l1840_l1837_l1832_l1829_DUPLICATE_0801_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1825_l1822_l1817_l1840_l1837_l1832_l1829_DUPLICATE_0801_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1825_l1822_l1817_l1840_l1837_l1832_l1829_DUPLICATE_0801_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1825_l1822_l1817_l1840_l1837_l1832_l1829_DUPLICATE_0801_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1825_l1822_l1817_l1840_l1837_l1832_l1829_DUPLICATE_0801_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1825_l1822_l1817_l1840_l1837_l1832_l1829_DUPLICATE_0801_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_33fa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_33fa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_33fa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_33fa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_33fa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_33fa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_33fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1840_l1837_l1832_l1829_DUPLICATE_4c64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1840_l1837_l1832_l1829_DUPLICATE_4c64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1840_l1837_l1832_l1829_DUPLICATE_4c64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1840_l1837_l1832_l1829_DUPLICATE_4c64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1840_l1837_l1832_l1829_DUPLICATE_4c64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1840_l1837_l1832_l1829_DUPLICATE_4c64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1840_l1837_l1832_l1829_DUPLICATE_4c64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1840_l1837_l1832_l1829_DUPLICATE_4c64_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_bbbf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_bbbf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_bbbf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_bbbf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_bbbf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_bbbf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_bbbf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1853_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_bbbf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_af0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_af0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_af0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_af0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_af0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_af0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_af0f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_53c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_53c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_53c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_53c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_53c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_53c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1825_l1822_l1848_l1817_l1837_l1832_l1829_DUPLICATE_53c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1837_c7_fc60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1843_c30_4add_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l1834_c3_ee66] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1834_c3_ee66_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1834_c3_ee66_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1834_c3_ee66_return_output := CONST_SL_8_uxn_opcodes_h_l1834_c3_ee66_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1848_c7_17fe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output;

     -- t8_MUX[uxn_opcodes_h_l1825_c7_b4f4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond;
     t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue;
     t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output := t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1817_c1_d460] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1837_c7_fc60] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1841_c3_a8f4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_left;
     BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_return_output := BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1848_c7_17fe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output := result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c7_0203] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1853_c7_0203] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1840_c7_7bd3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1846_c31_769f_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1841_c3_a8f4_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1845_c3_f5e1 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1845_l1850_DUPLICATE_2d97_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1834_c3_ee66_return_output;
     VAR_printf_uxn_opcodes_h_l1818_c3_52d9_uxn_opcodes_h_l1818_c3_52d9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_d460_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_0203_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1853_c7_0203_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1845_c3_f5e1;
     -- CONST_SR_8[uxn_opcodes_h_l1846_c31_769f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1846_c31_769f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1846_c31_769f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1846_c31_769f_return_output := CONST_SR_8_uxn_opcodes_h_l1846_c31_769f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1837_c7_fc60] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output;

     -- printf_uxn_opcodes_h_l1818_c3_52d9[uxn_opcodes_h_l1818_c3_52d9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1818_c3_52d9_uxn_opcodes_h_l1818_c3_52d9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1818_c3_52d9_uxn_opcodes_h_l1818_c3_52d9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1832_c7_245f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1848_c7_17fe] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1848_c7_17fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output;

     -- t8_MUX[uxn_opcodes_h_l1822_c7_01ed] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1822_c7_01ed_cond <= VAR_t8_MUX_uxn_opcodes_h_l1822_c7_01ed_cond;
     t8_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue;
     t8_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output := t8_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;

     -- n16_MUX[uxn_opcodes_h_l1840_c7_7bd3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond;
     n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue;
     n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output := n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1850_c22_36cb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1840_c7_7bd3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1850_c3_e865 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1850_c22_36cb_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_245f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1850_c3_e865;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1840_c7_7bd3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1832_c7_245f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1829_c7_ba9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1837_c7_fc60] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1837_c7_fc60_cond <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_fc60_cond;
     n16_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue;
     n16_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output := n16_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1840_c7_7bd3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1848_c7_17fe] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output := result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1837_c7_fc60] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output;

     -- t8_MUX[uxn_opcodes_h_l1817_c2_63f3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1817_c2_63f3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1817_c2_63f3_cond;
     t8_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue;
     t8_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output := t8_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1846_c21_c6c5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1846_c21_c6c5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1846_c31_769f_return_output);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1846_c21_c6c5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_245f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1848_c7_17fe_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1840_c7_7bd3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c7_245f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1837_c7_fc60] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1825_c7_b4f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1832_c7_245f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1832_c7_245f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1832_c7_245f_cond;
     n16_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue;
     n16_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1832_c7_245f_return_output := n16_MUX_uxn_opcodes_h_l1832_c7_245f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1840_c7_7bd3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1829_c7_ba9f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1837_c7_fc60] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1832_c7_245f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_245f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_7bd3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c7_245f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1829_c7_ba9f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond;
     n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue;
     n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output := n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1829_c7_ba9f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1822_c7_01ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1832_c7_245f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1837_c7_fc60] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output := result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1837_c7_fc60] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output := result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1825_c7_b4f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_245f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_245f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_fc60_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1822_c7_01ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1829_c7_ba9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1832_c7_245f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1825_c7_b4f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1817_c2_63f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1829_c7_ba9f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1832_c7_245f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1825_c7_b4f4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond;
     n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue;
     n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output := n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_245f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_245f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1817_c2_63f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1829_c7_ba9f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1825_c7_b4f4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1825_c7_b4f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1822_c7_01ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;

     -- n16_MUX[uxn_opcodes_h_l1822_c7_01ed] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1822_c7_01ed_cond <= VAR_n16_MUX_uxn_opcodes_h_l1822_c7_01ed_cond;
     n16_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue;
     n16_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output := n16_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1829_c7_ba9f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_ba9f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1825_c7_b4f4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1822_c7_01ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;

     -- n16_MUX[uxn_opcodes_h_l1817_c2_63f3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1817_c2_63f3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1817_c2_63f3_cond;
     n16_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue;
     n16_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output := n16_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1817_c2_63f3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1822_c7_01ed] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1825_c7_b4f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_b4f4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1817_c2_63f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1822_c7_01ed] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output := result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1822_c7_01ed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output := result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1817_c2_63f3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output;

     -- Submodule level 10
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1822_c7_01ed_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1817_c2_63f3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1817_c2_63f3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1858_l1812_DUPLICATE_e63d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1858_l1812_DUPLICATE_e63d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5abb(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_63f3_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1858_l1812_DUPLICATE_e63d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1858_l1812_DUPLICATE_e63d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
