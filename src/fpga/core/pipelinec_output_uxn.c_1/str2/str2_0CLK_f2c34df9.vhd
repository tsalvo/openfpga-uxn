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
-- BIN_OP_EQ[uxn_opcodes_h_l1812_c6_ef84]
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1812_c1_18b7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1812_c2_e1f2]
signal n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1812_c2_e1f2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1812_c2_e1f2]
signal result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c2_e1f2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1812_c2_e1f2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c2_e1f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1812_c2_e1f2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1812_c2_e1f2]
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1812_c2_e1f2]
signal t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1813_c3_a6b6[uxn_opcodes_h_l1813_c3_a6b6]
signal printf_uxn_opcodes_h_l1813_c3_a6b6_uxn_opcodes_h_l1813_c3_a6b6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1817_c11_608e]
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1817_c7_73b8]
signal n16_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1817_c7_73b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1817_c7_73b8]
signal result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1817_c7_73b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1817_c7_73b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1817_c7_73b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1817_c7_73b8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1817_c7_73b8]
signal result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1817_c7_73b8]
signal t8_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1820_c11_6f2f]
signal BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1820_c7_e946]
signal n16_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1820_c7_e946]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1820_c7_e946]
signal result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1820_c7_e946]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1820_c7_e946]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1820_c7_e946]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1820_c7_e946]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1820_c7_e946]
signal result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1820_c7_e946]
signal t8_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1824_c11_0871]
signal BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1824_c7_42d4]
signal n16_MUX_uxn_opcodes_h_l1824_c7_42d4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1824_c7_42d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1824_c7_42d4]
signal result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1824_c7_42d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1824_c7_42d4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1824_c7_42d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1824_c7_42d4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1824_c7_42d4]
signal result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1827_c11_da3f]
signal BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1827_c7_b49b]
signal n16_MUX_uxn_opcodes_h_l1827_c7_b49b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1827_c7_b49b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1827_c7_b49b]
signal result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1827_c7_b49b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1827_c7_b49b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1827_c7_b49b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1827_c7_b49b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1827_c7_b49b]
signal result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1829_c3_93c2]
signal CONST_SL_8_uxn_opcodes_h_l1829_c3_93c2_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1829_c3_93c2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1832_c11_8540]
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1832_c7_4a41]
signal n16_MUX_uxn_opcodes_h_l1832_c7_4a41_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1832_c7_4a41]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1832_c7_4a41]
signal result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1832_c7_4a41]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c7_4a41]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c7_4a41]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1832_c7_4a41]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1832_c7_4a41]
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1835_c11_8428]
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1835_c7_58a5]
signal n16_MUX_uxn_opcodes_h_l1835_c7_58a5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1835_c7_58a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1835_c7_58a5]
signal result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1835_c7_58a5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1835_c7_58a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1835_c7_58a5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1835_c7_58a5]
signal result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1836_c3_07ba]
signal BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1838_c30_d62c]
signal sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1841_c31_11fc]
signal CONST_SR_8_uxn_opcodes_h_l1841_c31_11fc_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1841_c31_11fc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1843_c11_7045]
signal BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1843_c7_6788]
signal result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1843_c7_6788]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1843_c7_6788]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1843_c7_6788]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1843_c7_6788]
signal result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1845_c22_7033]
signal BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1848_c11_e321]
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1848_c7_eb09]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1848_c7_eb09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_return_output : signed(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_ram_write := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84
BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_left,
BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_right,
BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_return_output);

-- n16_MUX_uxn_opcodes_h_l1812_c2_e1f2
n16_MUX_uxn_opcodes_h_l1812_c2_e1f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond,
n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue,
n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse,
n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2
result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond,
result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2
result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2
result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output);

-- t8_MUX_uxn_opcodes_h_l1812_c2_e1f2
t8_MUX_uxn_opcodes_h_l1812_c2_e1f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond,
t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue,
t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse,
t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output);

-- printf_uxn_opcodes_h_l1813_c3_a6b6_uxn_opcodes_h_l1813_c3_a6b6
printf_uxn_opcodes_h_l1813_c3_a6b6_uxn_opcodes_h_l1813_c3_a6b6 : entity work.printf_uxn_opcodes_h_l1813_c3_a6b6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1813_c3_a6b6_uxn_opcodes_h_l1813_c3_a6b6_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e
BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_left,
BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_right,
BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_return_output);

-- n16_MUX_uxn_opcodes_h_l1817_c7_73b8
n16_MUX_uxn_opcodes_h_l1817_c7_73b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1817_c7_73b8_cond,
n16_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue,
n16_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse,
n16_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8
result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8
result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output);

-- t8_MUX_uxn_opcodes_h_l1817_c7_73b8
t8_MUX_uxn_opcodes_h_l1817_c7_73b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1817_c7_73b8_cond,
t8_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue,
t8_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse,
t8_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_left,
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_right,
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_return_output);

-- n16_MUX_uxn_opcodes_h_l1820_c7_e946
n16_MUX_uxn_opcodes_h_l1820_c7_e946 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1820_c7_e946_cond,
n16_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue,
n16_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse,
n16_MUX_uxn_opcodes_h_l1820_c7_e946_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946
result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_cond,
result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946
result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_cond,
result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_return_output);

-- t8_MUX_uxn_opcodes_h_l1820_c7_e946
t8_MUX_uxn_opcodes_h_l1820_c7_e946 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1820_c7_e946_cond,
t8_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue,
t8_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse,
t8_MUX_uxn_opcodes_h_l1820_c7_e946_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871
BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_left,
BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_right,
BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_return_output);

-- n16_MUX_uxn_opcodes_h_l1824_c7_42d4
n16_MUX_uxn_opcodes_h_l1824_c7_42d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1824_c7_42d4_cond,
n16_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue,
n16_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse,
n16_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4
result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4
result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4
result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f
BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_left,
BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_right,
BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_return_output);

-- n16_MUX_uxn_opcodes_h_l1827_c7_b49b
n16_MUX_uxn_opcodes_h_l1827_c7_b49b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1827_c7_b49b_cond,
n16_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue,
n16_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse,
n16_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b
result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b
result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b
result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1829_c3_93c2
CONST_SL_8_uxn_opcodes_h_l1829_c3_93c2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1829_c3_93c2_x,
CONST_SL_8_uxn_opcodes_h_l1829_c3_93c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_left,
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_right,
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_return_output);

-- n16_MUX_uxn_opcodes_h_l1832_c7_4a41
n16_MUX_uxn_opcodes_h_l1832_c7_4a41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1832_c7_4a41_cond,
n16_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue,
n16_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse,
n16_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41
result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_cond,
result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_cond,
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_left,
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_right,
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_return_output);

-- n16_MUX_uxn_opcodes_h_l1835_c7_58a5
n16_MUX_uxn_opcodes_h_l1835_c7_58a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1835_c7_58a5_cond,
n16_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue,
n16_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse,
n16_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5
result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5
result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5
result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba
BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_left,
BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_right,
BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c
sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_ins,
sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_x,
sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_y,
sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1841_c31_11fc
CONST_SR_8_uxn_opcodes_h_l1841_c31_11fc : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1841_c31_11fc_x,
CONST_SR_8_uxn_opcodes_h_l1841_c31_11fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045
BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_left,
BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_right,
BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788
result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_cond,
result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788
result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788
result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788
result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788
result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_cond,
result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033
BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_left,
BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_right,
BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_left,
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_right,
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09
result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_return_output,
 n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output,
 t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_return_output,
 n16_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output,
 t8_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_return_output,
 n16_MUX_uxn_opcodes_h_l1820_c7_e946_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_return_output,
 t8_MUX_uxn_opcodes_h_l1820_c7_e946_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_return_output,
 n16_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_return_output,
 n16_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output,
 CONST_SL_8_uxn_opcodes_h_l1829_c3_93c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_return_output,
 n16_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_return_output,
 n16_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_return_output,
 sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_return_output,
 CONST_SR_8_uxn_opcodes_h_l1841_c31_11fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1814_c3_52a6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1813_c3_a6b6_uxn_opcodes_h_l1813_c3_a6b6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1818_c3_27d7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1820_c7_e946_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1817_c7_73b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1822_c3_adaa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1820_c7_e946_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1824_c7_42d4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1825_c3_18ce : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1827_c7_b49b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1830_c3_f15c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1829_c3_93c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1829_c3_93c2_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a41_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1833_c3_d7c1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1832_c7_4a41_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_58a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1840_c3_86ff : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1841_c31_11fc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1841_c31_11fc_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1841_c21_19aa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1845_c3_9208 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_return_output : signed(18 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1846_c21_be24_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1812_l1835_l1832_l1827_DUPLICATE_62ac_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_1e06_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_21e6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1812_l1832_l1827_DUPLICATE_142d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_365c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1835_l1832_l1827_DUPLICATE_704f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1828_l1836_DUPLICATE_2b88_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1845_l1840_DUPLICATE_1465_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1853_l1807_DUPLICATE_206f_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1814_c3_52a6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1814_c3_52a6;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1822_c3_adaa := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1822_c3_adaa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1818_c3_27d7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1818_c3_27d7;
     VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1825_c3_18ce := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1825_c3_18ce;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1833_c3_d7c1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1833_c3_d7c1;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1830_c3_f15c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1830_c3_f15c;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse := n16;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_365c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_365c_return_output := result.u8_value;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1845_l1840_DUPLICATE_1465 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1845_l1840_DUPLICATE_1465_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- sp_relative_shift[uxn_opcodes_h_l1838_c30_d62c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_ins;
     sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_x;
     sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_return_output := sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1812_l1835_l1832_l1827_DUPLICATE_62ac LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1812_l1835_l1832_l1827_DUPLICATE_62ac_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1817_c11_608e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1835_l1832_l1827_DUPLICATE_704f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1835_l1832_l1827_DUPLICATE_704f_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_1e06 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_1e06_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1827_c11_da3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1848_c11_e321] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_left;
     BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_return_output := BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1835_c11_8428] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_left;
     BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_return_output := BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_21e6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_21e6_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1832_c11_8540] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_left;
     BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_return_output := BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1812_c6_ef84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_left;
     BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_return_output := BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1832_c7_4a41] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1832_c7_4a41_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1812_l1832_l1827_DUPLICATE_142d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1812_l1832_l1827_DUPLICATE_142d_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1843_c11_7045] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_left;
     BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_return_output := BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1828_l1836_DUPLICATE_2b88 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1828_l1836_DUPLICATE_2b88_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1820_c11_6f2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1824_c11_0871] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_left;
     BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_return_output := BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1846_c21_be24] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1846_c21_be24_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_ef84_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1817_c7_73b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1817_c7_73b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_608e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1820_c7_e946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1820_c7_e946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_6f2f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1824_c7_42d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_0871_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1827_c7_b49b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_da3f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_8540_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_58a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_8428_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_7045_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_e321_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1845_l1840_DUPLICATE_1465_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1828_l1836_DUPLICATE_2b88_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1829_c3_93c2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1828_l1836_DUPLICATE_2b88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1846_c21_be24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1812_l1835_l1832_l1827_DUPLICATE_62ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1812_l1835_l1832_l1827_DUPLICATE_62ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1812_l1835_l1832_l1827_DUPLICATE_62ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1812_l1835_l1832_l1827_DUPLICATE_62ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1812_l1835_l1832_l1827_DUPLICATE_62ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1812_l1835_l1832_l1827_DUPLICATE_62ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1812_l1835_l1832_l1827_DUPLICATE_62ac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_1e06_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_1e06_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_1e06_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_1e06_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_1e06_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_1e06_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_1e06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1835_l1832_l1827_DUPLICATE_704f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1835_l1832_l1827_DUPLICATE_704f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1835_l1832_l1827_DUPLICATE_704f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1835_l1832_l1827_DUPLICATE_704f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1835_l1832_l1827_DUPLICATE_704f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1835_l1832_l1827_DUPLICATE_704f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1835_l1832_l1827_DUPLICATE_704f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1835_l1832_l1827_DUPLICATE_704f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1812_l1832_l1827_DUPLICATE_142d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1812_l1832_l1827_DUPLICATE_142d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1812_l1832_l1827_DUPLICATE_142d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1812_l1832_l1827_DUPLICATE_142d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1812_l1832_l1827_DUPLICATE_142d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1812_l1832_l1827_DUPLICATE_142d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1812_l1832_l1827_DUPLICATE_142d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1824_l1820_l1848_l1817_l1843_l1812_l1832_l1827_DUPLICATE_142d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_21e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_21e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_21e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_21e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_21e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_21e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_21e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_365c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_365c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_365c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_365c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_365c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_365c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1824_l1820_l1817_l1843_l1812_l1832_l1827_DUPLICATE_365c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1832_c7_4a41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_d62c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1835_c7_58a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1832_c7_4a41] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1829_c3_93c2] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1829_c3_93c2_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1829_c3_93c2_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1829_c3_93c2_return_output := CONST_SL_8_uxn_opcodes_h_l1829_c3_93c2_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1843_c7_6788] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_return_output := result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1836_c3_07ba] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_left;
     BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_return_output := BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1843_c7_6788] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1848_c7_eb09] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1812_c1_18b7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_return_output;

     -- t8_MUX[uxn_opcodes_h_l1820_c7_e946] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1820_c7_e946_cond <= VAR_t8_MUX_uxn_opcodes_h_l1820_c7_e946_cond;
     t8_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue;
     t8_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1820_c7_e946_return_output := t8_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1848_c7_eb09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1841_c31_11fc_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_07ba_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1840_c3_86ff := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_a937_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1829_c3_93c2_return_output;
     VAR_printf_uxn_opcodes_h_l1813_c3_a6b6_uxn_opcodes_h_l1813_c3_a6b6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_18b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_eb09_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_eb09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_6788_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_6788_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1840_c3_86ff;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1827_c7_b49b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1835_c7_58a5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1845_c22_7033] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1841_c31_11fc] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1841_c31_11fc_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1841_c31_11fc_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1841_c31_11fc_return_output := CONST_SR_8_uxn_opcodes_h_l1841_c31_11fc_return_output;

     -- t8_MUX[uxn_opcodes_h_l1817_c7_73b8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1817_c7_73b8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1817_c7_73b8_cond;
     t8_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue;
     t8_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output := t8_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1843_c7_6788] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_return_output;

     -- n16_MUX[uxn_opcodes_h_l1835_c7_58a5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1835_c7_58a5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1835_c7_58a5_cond;
     n16_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue;
     n16_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output := n16_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1843_c7_6788] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_return_output;

     -- printf_uxn_opcodes_h_l1813_c3_a6b6[uxn_opcodes_h_l1813_c3_a6b6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1813_c3_a6b6_uxn_opcodes_h_l1813_c3_a6b6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1813_c3_a6b6_uxn_opcodes_h_l1813_c3_a6b6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1832_c7_4a41] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1845_c3_9208 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_7033_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_6788_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_6788_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1845_c3_9208;
     -- t8_MUX[uxn_opcodes_h_l1812_c2_e1f2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond <= VAR_t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond;
     t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue;
     t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output := t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1841_c21_19aa] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1841_c21_19aa_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1841_c31_11fc_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c7_4a41] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1824_c7_42d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1832_c7_4a41] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1832_c7_4a41_cond <= VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a41_cond;
     n16_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue;
     n16_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output := n16_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1835_c7_58a5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1827_c7_b49b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1835_c7_58a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1843_c7_6788] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_return_output := result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1841_c21_19aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_6788_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1827_c7_b49b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1827_c7_b49b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1827_c7_b49b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1827_c7_b49b_cond;
     n16_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue;
     n16_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output := n16_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1832_c7_4a41] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1820_c7_e946] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1824_c7_42d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1835_c7_58a5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c7_4a41] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1835_c7_58a5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_58a5_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1832_c7_4a41] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output := result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1824_c7_42d4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1832_c7_4a41] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output := result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1817_c7_73b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1827_c7_b49b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1824_c7_42d4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1824_c7_42d4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1824_c7_42d4_cond;
     n16_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue;
     n16_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output := n16_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1820_c7_e946] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1827_c7_b49b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a41_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1824_c7_42d4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1817_c7_73b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1820_c7_e946] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1820_c7_e946_cond <= VAR_n16_MUX_uxn_opcodes_h_l1820_c7_e946_cond;
     n16_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue;
     n16_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1820_c7_e946_return_output := n16_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1820_c7_e946] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1827_c7_b49b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c2_e1f2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1827_c7_b49b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1824_c7_42d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_b49b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1824_c7_42d4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1824_c7_42d4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1812_c2_e1f2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1817_c7_73b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1820_c7_e946] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1820_c7_e946] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;

     -- n16_MUX[uxn_opcodes_h_l1817_c7_73b8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1817_c7_73b8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1817_c7_73b8_cond;
     n16_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue;
     n16_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output := n16_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_42d4_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1820_c7_e946] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_return_output := result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;

     -- n16_MUX[uxn_opcodes_h_l1812_c2_e1f2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond;
     n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue;
     n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output := n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1817_c7_73b8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1820_c7_e946] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_return_output := result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1817_c7_73b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1812_c2_e1f2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_e946_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c2_e1f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1817_c7_73b8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1812_c2_e1f2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1817_c7_73b8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;

     -- Submodule level 10
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_73b8_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1812_c2_e1f2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output := result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1812_c2_e1f2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1853_l1807_DUPLICATE_206f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1853_l1807_DUPLICATE_206f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_e1f2_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1853_l1807_DUPLICATE_206f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1853_l1807_DUPLICATE_206f_return_output;
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
