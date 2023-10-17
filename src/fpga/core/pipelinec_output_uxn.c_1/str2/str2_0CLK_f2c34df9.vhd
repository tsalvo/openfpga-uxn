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
-- BIN_OP_EQ[uxn_opcodes_h_l1812_c6_5340]
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1812_c1_a613]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1812_c2_de8a]
signal n16_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1812_c2_de8a]
signal t8_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1812_c2_de8a]
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1812_c2_de8a]
signal result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c2_de8a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1812_c2_de8a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1812_c2_de8a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1812_c2_de8a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c2_de8a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : unsigned(3 downto 0);

-- printf_uxn_opcodes_h_l1813_c3_83cd[uxn_opcodes_h_l1813_c3_83cd]
signal printf_uxn_opcodes_h_l1813_c3_83cd_uxn_opcodes_h_l1813_c3_83cd_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1817_c11_fe77]
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1817_c7_ee4c]
signal n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1817_c7_ee4c]
signal t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1817_c7_ee4c]
signal result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1817_c7_ee4c]
signal result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1817_c7_ee4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1817_c7_ee4c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1817_c7_ee4c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1817_c7_ee4c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1817_c7_ee4c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1820_c11_ed1b]
signal BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1820_c7_f171]
signal n16_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1820_c7_f171]
signal t8_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1820_c7_f171]
signal result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1820_c7_f171]
signal result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1820_c7_f171]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1820_c7_f171]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1820_c7_f171]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1820_c7_f171]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1820_c7_f171]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1824_c11_1391]
signal BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1824_c7_aae7]
signal n16_MUX_uxn_opcodes_h_l1824_c7_aae7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1824_c7_aae7]
signal result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1824_c7_aae7]
signal result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1824_c7_aae7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1824_c7_aae7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1824_c7_aae7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1824_c7_aae7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1824_c7_aae7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1827_c11_7df5]
signal BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1827_c7_13c3]
signal n16_MUX_uxn_opcodes_h_l1827_c7_13c3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1827_c7_13c3]
signal result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1827_c7_13c3]
signal result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1827_c7_13c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1827_c7_13c3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1827_c7_13c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1827_c7_13c3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1827_c7_13c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1829_c3_2285]
signal CONST_SL_8_uxn_opcodes_h_l1829_c3_2285_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1829_c3_2285_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1832_c11_b89f]
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1832_c7_4a99]
signal n16_MUX_uxn_opcodes_h_l1832_c7_4a99_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1832_c7_4a99]
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1832_c7_4a99]
signal result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c7_4a99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1832_c7_4a99]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1832_c7_4a99]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c7_4a99]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1832_c7_4a99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1835_c11_ec61]
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1835_c7_df37]
signal n16_MUX_uxn_opcodes_h_l1835_c7_df37_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1835_c7_df37_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1835_c7_df37]
signal result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1835_c7_df37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1835_c7_df37]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1835_c7_df37]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1835_c7_df37]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1835_c7_df37]
signal result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1836_c3_884b]
signal BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1838_c30_c4d7]
signal sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1841_c31_4adf]
signal CONST_SR_8_uxn_opcodes_h_l1841_c31_4adf_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1841_c31_4adf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1843_c11_0e16]
signal BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1843_c7_11e7]
signal result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1843_c7_11e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1843_c7_11e7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1843_c7_11e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1843_c7_11e7]
signal result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1845_c22_1ce8]
signal BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1848_c11_2340]
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1848_c7_ba72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1848_c7_ba72]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_return_output : signed(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_643c( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340
BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_left,
BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_right,
BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_return_output);

-- n16_MUX_uxn_opcodes_h_l1812_c2_de8a
n16_MUX_uxn_opcodes_h_l1812_c2_de8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1812_c2_de8a_cond,
n16_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue,
n16_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse,
n16_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output);

-- t8_MUX_uxn_opcodes_h_l1812_c2_de8a
t8_MUX_uxn_opcodes_h_l1812_c2_de8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1812_c2_de8a_cond,
t8_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue,
t8_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse,
t8_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a
result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a
result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a
result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output);

-- printf_uxn_opcodes_h_l1813_c3_83cd_uxn_opcodes_h_l1813_c3_83cd
printf_uxn_opcodes_h_l1813_c3_83cd_uxn_opcodes_h_l1813_c3_83cd : entity work.printf_uxn_opcodes_h_l1813_c3_83cd_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1813_c3_83cd_uxn_opcodes_h_l1813_c3_83cd_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77
BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_left,
BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_right,
BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_return_output);

-- n16_MUX_uxn_opcodes_h_l1817_c7_ee4c
n16_MUX_uxn_opcodes_h_l1817_c7_ee4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond,
n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue,
n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse,
n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output);

-- t8_MUX_uxn_opcodes_h_l1817_c7_ee4c
t8_MUX_uxn_opcodes_h_l1817_c7_ee4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond,
t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue,
t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse,
t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c
result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c
result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_left,
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_right,
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_return_output);

-- n16_MUX_uxn_opcodes_h_l1820_c7_f171
n16_MUX_uxn_opcodes_h_l1820_c7_f171 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1820_c7_f171_cond,
n16_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue,
n16_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse,
n16_MUX_uxn_opcodes_h_l1820_c7_f171_return_output);

-- t8_MUX_uxn_opcodes_h_l1820_c7_f171
t8_MUX_uxn_opcodes_h_l1820_c7_f171 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1820_c7_f171_cond,
t8_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue,
t8_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse,
t8_MUX_uxn_opcodes_h_l1820_c7_f171_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171
result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_cond,
result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171
result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_cond,
result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391
BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_left,
BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_right,
BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_return_output);

-- n16_MUX_uxn_opcodes_h_l1824_c7_aae7
n16_MUX_uxn_opcodes_h_l1824_c7_aae7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1824_c7_aae7_cond,
n16_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue,
n16_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse,
n16_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7
result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7
result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7
result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5
BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_left,
BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_right,
BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_return_output);

-- n16_MUX_uxn_opcodes_h_l1827_c7_13c3
n16_MUX_uxn_opcodes_h_l1827_c7_13c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1827_c7_13c3_cond,
n16_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue,
n16_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse,
n16_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3
result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3
result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3
result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1829_c3_2285
CONST_SL_8_uxn_opcodes_h_l1829_c3_2285 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1829_c3_2285_x,
CONST_SL_8_uxn_opcodes_h_l1829_c3_2285_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_left,
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_right,
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_return_output);

-- n16_MUX_uxn_opcodes_h_l1832_c7_4a99
n16_MUX_uxn_opcodes_h_l1832_c7_4a99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1832_c7_4a99_cond,
n16_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue,
n16_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse,
n16_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_cond,
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99
result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_cond,
result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_left,
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_right,
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_return_output);

-- n16_MUX_uxn_opcodes_h_l1835_c7_df37
n16_MUX_uxn_opcodes_h_l1835_c7_df37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1835_c7_df37_cond,
n16_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue,
n16_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse,
n16_MUX_uxn_opcodes_h_l1835_c7_df37_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37
result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_cond,
result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37
result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37
result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_cond,
result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b
BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_left,
BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_right,
BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7
sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_ins,
sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_x,
sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_y,
sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1841_c31_4adf
CONST_SR_8_uxn_opcodes_h_l1841_c31_4adf : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1841_c31_4adf_x,
CONST_SR_8_uxn_opcodes_h_l1841_c31_4adf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16
BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_left,
BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_right,
BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7
result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7
result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7
result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7
result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7
result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8
BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_left,
BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_right,
BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_left,
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_right,
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72
result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_return_output,
 n16_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output,
 t8_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_return_output,
 n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output,
 t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_return_output,
 n16_MUX_uxn_opcodes_h_l1820_c7_f171_return_output,
 t8_MUX_uxn_opcodes_h_l1820_c7_f171_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_return_output,
 n16_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_return_output,
 n16_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output,
 CONST_SL_8_uxn_opcodes_h_l1829_c3_2285_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_return_output,
 n16_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_return_output,
 n16_MUX_uxn_opcodes_h_l1835_c7_df37_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_return_output,
 sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_return_output,
 CONST_SR_8_uxn_opcodes_h_l1841_c31_4adf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1814_c3_9275 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1813_c3_83cd_uxn_opcodes_h_l1813_c3_83cd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1818_c3_e6c9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1822_c3_220d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1824_c7_aae7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1825_c3_8aa6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1827_c7_13c3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1830_c3_5d3a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1829_c3_2285_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1829_c3_2285_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_df37_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a99_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1833_c3_7569 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1832_c7_4a99_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_df37_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1840_c3_a819 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1841_c31_4adf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1841_c31_4adf_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1841_c21_cb16_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1845_c3_20bc : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_return_output : signed(18 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1846_c21_f30a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_1737_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_9314_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1812_l1832_DUPLICATE_5094_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1812_l1835_l1832_DUPLICATE_dfb8_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_6086_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1835_l1832_DUPLICATE_0b44_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1828_l1836_DUPLICATE_95b3_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1845_l1840_DUPLICATE_a917_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1853_l1807_DUPLICATE_c3be_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1833_c3_7569 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1833_c3_7569;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1822_c3_220d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1822_c3_220d;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_y := resize(to_signed(-3, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1825_c3_8aa6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1825_c3_8aa6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1818_c3_e6c9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1818_c3_e6c9;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1830_c3_5d3a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1830_c3_5d3a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1814_c3_9275 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1814_c3_9275;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse := n16;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_1737 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_1737_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1820_c11_ed1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1824_c11_1391] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_left;
     BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_return_output := BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1832_c7_4a99] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1832_c7_4a99_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1832_c11_b89f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1835_l1832_DUPLICATE_0b44 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1835_l1832_DUPLICATE_0b44_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1848_c11_2340] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_left;
     BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_return_output := BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1843_c11_0e16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_left;
     BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_return_output := BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1828_l1836_DUPLICATE_95b3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1828_l1836_DUPLICATE_95b3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_9314 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_9314_return_output := result.u16_value;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1845_l1840_DUPLICATE_a917 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1845_l1840_DUPLICATE_a917_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_6086 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_6086_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1827_c11_7df5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1835_c11_ec61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_left;
     BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_return_output := BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1846_c21_f30a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1846_c21_f30a_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1817_c11_fe77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_left;
     BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_return_output := BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1812_c6_5340] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_left;
     BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_return_output := BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1812_l1832_DUPLICATE_5094 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1812_l1832_DUPLICATE_5094_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1812_l1835_l1832_DUPLICATE_dfb8 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1812_l1835_l1832_DUPLICATE_dfb8_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1838_c30_c4d7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_ins;
     sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_x;
     sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_return_output := sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1812_c2_de8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1812_c2_de8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_5340_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_fe77_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1820_c7_f171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1820_c7_f171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_ed1b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1824_c7_aae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_1391_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1827_c7_13c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_7df5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_b89f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_df37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_ec61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_0e16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_2340_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1845_l1840_DUPLICATE_a917_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1828_l1836_DUPLICATE_95b3_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1829_c3_2285_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1828_l1836_DUPLICATE_95b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1846_c21_f30a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1812_l1835_l1832_DUPLICATE_dfb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1812_l1835_l1832_DUPLICATE_dfb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1812_l1835_l1832_DUPLICATE_dfb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1812_l1835_l1832_DUPLICATE_dfb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1812_l1835_l1832_DUPLICATE_dfb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1812_l1835_l1832_DUPLICATE_dfb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1812_l1835_l1832_DUPLICATE_dfb8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_9314_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_9314_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_9314_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_9314_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_9314_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_9314_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_9314_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1835_l1832_DUPLICATE_0b44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1835_l1832_DUPLICATE_0b44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1835_l1832_DUPLICATE_0b44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1835_l1832_DUPLICATE_0b44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1835_l1832_DUPLICATE_0b44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1835_l1832_DUPLICATE_0b44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1835_l1832_DUPLICATE_0b44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1835_l1832_DUPLICATE_0b44_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1812_l1832_DUPLICATE_5094_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1812_l1832_DUPLICATE_5094_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1812_l1832_DUPLICATE_5094_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1812_l1832_DUPLICATE_5094_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1812_l1832_DUPLICATE_5094_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1812_l1832_DUPLICATE_5094_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1812_l1832_DUPLICATE_5094_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1848_l1817_l1843_l1812_l1832_DUPLICATE_5094_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_6086_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_6086_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_6086_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_6086_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_6086_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_6086_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_6086_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_1737_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_1737_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_1737_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_1737_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_1737_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_1737_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1827_l1824_l1820_l1817_l1843_l1812_l1832_DUPLICATE_1737_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1832_c7_4a99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1838_c30_c4d7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1843_c7_11e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1829_c3_2285] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1829_c3_2285_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1829_c3_2285_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1829_c3_2285_return_output := CONST_SL_8_uxn_opcodes_h_l1829_c3_2285_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1812_c1_a613] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1836_c3_884b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_left;
     BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_return_output := BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1835_c7_df37] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1843_c7_11e7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1832_c7_4a99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1848_c7_ba72] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1848_c7_ba72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_return_output;

     -- t8_MUX[uxn_opcodes_h_l1820_c7_f171] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1820_c7_f171_cond <= VAR_t8_MUX_uxn_opcodes_h_l1820_c7_f171_cond;
     t8_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue;
     t8_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1820_c7_f171_return_output := t8_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1841_c31_4adf_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1836_c3_884b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1840_c3_a819 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1840_l1845_DUPLICATE_6e0d_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1829_c3_2285_return_output;
     VAR_printf_uxn_opcodes_h_l1813_c3_83cd_uxn_opcodes_h_l1813_c3_83cd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_a613_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_ba72_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1848_c7_ba72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_df37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1840_c3_a819;
     -- n16_MUX[uxn_opcodes_h_l1835_c7_df37] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1835_c7_df37_cond <= VAR_n16_MUX_uxn_opcodes_h_l1835_c7_df37_cond;
     n16_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue;
     n16_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_df37_return_output := n16_MUX_uxn_opcodes_h_l1835_c7_df37_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1832_c7_4a99] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1835_c7_df37] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_return_output;

     -- t8_MUX[uxn_opcodes_h_l1817_c7_ee4c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond;
     t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue;
     t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output := t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;

     -- printf_uxn_opcodes_h_l1813_c3_83cd[uxn_opcodes_h_l1813_c3_83cd] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1813_c3_83cd_uxn_opcodes_h_l1813_c3_83cd_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1813_c3_83cd_uxn_opcodes_h_l1813_c3_83cd_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1827_c7_13c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1843_c7_11e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1843_c7_11e7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1841_c31_4adf] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1841_c31_4adf_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1841_c31_4adf_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1841_c31_4adf_return_output := CONST_SR_8_uxn_opcodes_h_l1841_c31_4adf_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1845_c22_1ce8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1845_c3_20bc := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1845_c22_1ce8_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1835_c7_df37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_df37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1845_c3_20bc;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1841_c21_cb16] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1841_c21_cb16_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1841_c31_4adf_return_output);

     -- t8_MUX[uxn_opcodes_h_l1812_c2_de8a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1812_c2_de8a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1812_c2_de8a_cond;
     t8_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue;
     t8_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output := t8_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1843_c7_11e7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c7_4a99] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1827_c7_13c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1835_c7_df37] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_return_output;

     -- n16_MUX[uxn_opcodes_h_l1832_c7_4a99] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1832_c7_4a99_cond <= VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a99_cond;
     n16_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue;
     n16_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output := n16_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1824_c7_aae7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1835_c7_df37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1841_c21_cb16_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_df37_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_df37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1843_c7_11e7_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1835_c7_df37] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_return_output := result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1827_c7_13c3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1820_c7_f171] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1835_c7_df37] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_return_output := result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1832_c7_4a99] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1824_c7_aae7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1827_c7_13c3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1827_c7_13c3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1827_c7_13c3_cond;
     n16_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue;
     n16_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output := n16_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c7_4a99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_df37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_df37_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1824_c7_aae7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1832_c7_4a99] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output := result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1817_c7_ee4c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1824_c7_aae7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1824_c7_aae7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1824_c7_aae7_cond;
     n16_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue;
     n16_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output := n16_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1832_c7_4a99] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output := result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1820_c7_f171] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1827_c7_13c3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1827_c7_13c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_4a99_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1827_c7_13c3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1824_c7_aae7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1817_c7_ee4c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1820_c7_f171] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1820_c7_f171_cond <= VAR_n16_MUX_uxn_opcodes_h_l1820_c7_f171_cond;
     n16_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue;
     n16_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1820_c7_f171_return_output := n16_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1824_c7_aae7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c2_de8a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1820_c7_f171] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1827_c7_13c3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_13c3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1824_c7_aae7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1812_c2_de8a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1817_c7_ee4c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond;
     n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue;
     n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output := n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1820_c7_f171] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1820_c7_f171] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1817_c7_ee4c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1824_c7_aae7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c7_aae7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1812_c2_de8a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1817_c7_ee4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1817_c7_ee4c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1812_c2_de8a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1812_c2_de8a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1812_c2_de8a_cond;
     n16_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue;
     n16_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output := n16_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1820_c7_f171] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_return_output := result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1820_c7_f171] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_return_output := result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_f171_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1817_c7_ee4c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c2_de8a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1817_c7_ee4c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1812_c2_de8a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output;

     -- Submodule level 10
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1817_c7_ee4c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1812_c2_de8a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1812_c2_de8a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1853_l1807_DUPLICATE_c3be LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1853_l1807_DUPLICATE_c3be_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_643c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_de8a_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1853_l1807_DUPLICATE_c3be_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1853_l1807_DUPLICATE_c3be_return_output;
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
