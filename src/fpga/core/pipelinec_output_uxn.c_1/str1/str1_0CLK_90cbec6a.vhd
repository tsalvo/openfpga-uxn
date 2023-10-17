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
-- BIN_OP_EQ[uxn_opcodes_h_l1774_c6_b614]
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1774_c1_60b3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1774_c2_5276]
signal n8_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1774_c2_5276]
signal t8_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1774_c2_5276]
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1774_c2_5276]
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1774_c2_5276]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1774_c2_5276]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1774_c2_5276]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1774_c2_5276]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1774_c2_5276]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : unsigned(3 downto 0);

-- printf_uxn_opcodes_h_l1775_c3_d698[uxn_opcodes_h_l1775_c3_d698]
signal printf_uxn_opcodes_h_l1775_c3_d698_uxn_opcodes_h_l1775_c3_d698_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_6820]
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1779_c7_b499]
signal n8_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1779_c7_b499]
signal t8_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1779_c7_b499]
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1779_c7_b499]
signal result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_b499]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1779_c7_b499]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1779_c7_b499]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_b499]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_b499]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1782_c11_b3e7]
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1782_c7_4cf7]
signal n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1782_c7_4cf7]
signal t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1782_c7_4cf7]
signal result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1782_c7_4cf7]
signal result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1782_c7_4cf7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1782_c7_4cf7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1782_c7_4cf7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1782_c7_4cf7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1782_c7_4cf7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_6575]
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1786_c7_3e35]
signal n8_MUX_uxn_opcodes_h_l1786_c7_3e35_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1786_c7_3e35]
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1786_c7_3e35]
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_3e35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1786_c7_3e35]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1786_c7_3e35]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1786_c7_3e35]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1786_c7_3e35]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_8d0c]
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1789_c7_7850]
signal n8_MUX_uxn_opcodes_h_l1789_c7_7850_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1789_c7_7850_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_7850]
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_7850]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1789_c7_7850]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1789_c7_7850]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1789_c7_7850]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1789_c7_7850]
signal result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1792_c30_4971]
signal sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1794_c22_6770]
signal BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1797_c11_9dcc]
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1797_c7_fefe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1797_c7_fefe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1797_c7_fefe]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614
BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_left,
BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_right,
BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_return_output);

-- n8_MUX_uxn_opcodes_h_l1774_c2_5276
n8_MUX_uxn_opcodes_h_l1774_c2_5276 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1774_c2_5276_cond,
n8_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue,
n8_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse,
n8_MUX_uxn_opcodes_h_l1774_c2_5276_return_output);

-- t8_MUX_uxn_opcodes_h_l1774_c2_5276
t8_MUX_uxn_opcodes_h_l1774_c2_5276 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1774_c2_5276_cond,
t8_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue,
t8_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse,
t8_MUX_uxn_opcodes_h_l1774_c2_5276_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276
result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_cond,
result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276
result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_cond,
result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276
result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276
result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_return_output);

-- printf_uxn_opcodes_h_l1775_c3_d698_uxn_opcodes_h_l1775_c3_d698
printf_uxn_opcodes_h_l1775_c3_d698_uxn_opcodes_h_l1775_c3_d698 : entity work.printf_uxn_opcodes_h_l1775_c3_d698_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1775_c3_d698_uxn_opcodes_h_l1775_c3_d698_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_left,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_right,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_return_output);

-- n8_MUX_uxn_opcodes_h_l1779_c7_b499
n8_MUX_uxn_opcodes_h_l1779_c7_b499 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1779_c7_b499_cond,
n8_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue,
n8_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse,
n8_MUX_uxn_opcodes_h_l1779_c7_b499_return_output);

-- t8_MUX_uxn_opcodes_h_l1779_c7_b499
t8_MUX_uxn_opcodes_h_l1779_c7_b499 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1779_c7_b499_cond,
t8_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue,
t8_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse,
t8_MUX_uxn_opcodes_h_l1779_c7_b499_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_cond,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499
result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_cond,
result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499
result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_left,
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_right,
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_return_output);

-- n8_MUX_uxn_opcodes_h_l1782_c7_4cf7
n8_MUX_uxn_opcodes_h_l1782_c7_4cf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond,
n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue,
n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse,
n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output);

-- t8_MUX_uxn_opcodes_h_l1782_c7_4cf7
t8_MUX_uxn_opcodes_h_l1782_c7_4cf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond,
t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue,
t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse,
t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7
result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7
result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_left,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_right,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_return_output);

-- n8_MUX_uxn_opcodes_h_l1786_c7_3e35
n8_MUX_uxn_opcodes_h_l1786_c7_3e35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1786_c7_3e35_cond,
n8_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue,
n8_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse,
n8_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_cond,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_cond,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35
result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_left,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_right,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_return_output);

-- n8_MUX_uxn_opcodes_h_l1789_c7_7850
n8_MUX_uxn_opcodes_h_l1789_c7_7850 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1789_c7_7850_cond,
n8_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue,
n8_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse,
n8_MUX_uxn_opcodes_h_l1789_c7_7850_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_cond,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850
result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850
result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_cond,
result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1792_c30_4971
sp_relative_shift_uxn_opcodes_h_l1792_c30_4971 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_ins,
sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_x,
sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_y,
sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770
BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_left,
BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_right,
BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_left,
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_right,
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe
result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe
result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_return_output,
 n8_MUX_uxn_opcodes_h_l1774_c2_5276_return_output,
 t8_MUX_uxn_opcodes_h_l1774_c2_5276_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_return_output,
 n8_MUX_uxn_opcodes_h_l1779_c7_b499_return_output,
 t8_MUX_uxn_opcodes_h_l1779_c7_b499_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_return_output,
 n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output,
 t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_return_output,
 n8_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_return_output,
 n8_MUX_uxn_opcodes_h_l1789_c7_7850_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_return_output,
 sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_2abc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1775_c3_d698_uxn_opcodes_h_l1775_c3_d698_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1780_c3_3836 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_99b4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1789_c7_7850_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1786_c7_3e35_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_11be : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1786_c7_3e35_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1789_c7_7850_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1794_c3_8a6e : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1794_c27_df4d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_aefe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_7ab0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1779_l1774_l1797_l1786_l1782_DUPLICATE_fc55_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_d512_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1779_l1774_l1797_l1786_l1782_DUPLICATE_5fe7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1779_l1797_l1789_l1786_l1782_DUPLICATE_84f1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1804_l1770_DUPLICATE_f344_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_2abc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_2abc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1780_c3_3836 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1780_c3_3836;
     VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_99b4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_99b4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_11be := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_11be;
     VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_aefe LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_aefe_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1779_l1797_l1789_l1786_l1782_DUPLICATE_84f1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1779_l1797_l1789_l1786_l1782_DUPLICATE_84f1_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_7ab0 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_7ab0_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1774_c6_b614] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_left;
     BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_return_output := BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1792_c30_4971] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_ins;
     sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_x;
     sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_return_output := sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1786_c7_3e35] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1786_c7_3e35_return_output := result.stack_address_sp_offset;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1794_c27_df4d] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1794_c27_df4d_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1797_c11_9dcc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1779_l1774_l1797_l1786_l1782_DUPLICATE_fc55 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1779_l1774_l1797_l1786_l1782_DUPLICATE_fc55_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_6820] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_left;
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_return_output := BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1782_c11_b3e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_d512 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_d512_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1779_l1774_l1797_l1786_l1782_DUPLICATE_5fe7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1779_l1774_l1797_l1786_l1782_DUPLICATE_5fe7_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_6575] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_left;
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_return_output := BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_8d0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1774_c2_5276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1774_c2_5276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_b614_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1779_c7_b499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1779_c7_b499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_6820_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_b3e7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1786_c7_3e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_6575_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1789_c7_7850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_8d0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_9dcc_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1794_c27_df4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_d512_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_d512_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_d512_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_d512_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_d512_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_7ab0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_7ab0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_7ab0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_7ab0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_7ab0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1779_l1797_l1789_l1786_l1782_DUPLICATE_84f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1779_l1797_l1789_l1786_l1782_DUPLICATE_84f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1779_l1797_l1789_l1786_l1782_DUPLICATE_84f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1779_l1797_l1789_l1786_l1782_DUPLICATE_84f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1779_l1797_l1789_l1786_l1782_DUPLICATE_84f1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1779_l1774_l1797_l1786_l1782_DUPLICATE_fc55_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1779_l1774_l1797_l1786_l1782_DUPLICATE_fc55_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1779_l1774_l1797_l1786_l1782_DUPLICATE_fc55_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1779_l1774_l1797_l1786_l1782_DUPLICATE_fc55_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1779_l1774_l1797_l1786_l1782_DUPLICATE_fc55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1779_l1774_l1797_l1786_l1782_DUPLICATE_5fe7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1779_l1774_l1797_l1786_l1782_DUPLICATE_5fe7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1779_l1774_l1797_l1786_l1782_DUPLICATE_5fe7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1779_l1774_l1797_l1786_l1782_DUPLICATE_5fe7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1779_l1774_l1797_l1786_l1782_DUPLICATE_5fe7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_aefe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_aefe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_aefe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_aefe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1779_l1774_l1789_l1786_l1782_DUPLICATE_aefe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1786_c7_3e35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_4971_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1786_c7_3e35] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1774_c1_60b3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1789_c7_7850] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1797_c7_fefe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output;

     -- t8_MUX[uxn_opcodes_h_l1782_c7_4cf7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond;
     t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue;
     t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output := t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1797_c7_fefe] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_7850] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_return_output := result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_return_output;

     -- n8_MUX[uxn_opcodes_h_l1789_c7_7850] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1789_c7_7850_cond <= VAR_n8_MUX_uxn_opcodes_h_l1789_c7_7850_cond;
     n8_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue;
     n8_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1789_c7_7850_return_output := n8_MUX_uxn_opcodes_h_l1789_c7_7850_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1797_c7_fefe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1794_c22_6770] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1794_c3_8a6e := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_6770_return_output)),16);
     VAR_printf_uxn_opcodes_h_l1775_c3_d698_uxn_opcodes_h_l1775_c3_d698_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_60b3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1789_c7_7850_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fefe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_7850_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_7850_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1794_c3_8a6e;
     -- result_u16_value_MUX[uxn_opcodes_h_l1789_c7_7850] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_return_output := result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_return_output;

     -- n8_MUX[uxn_opcodes_h_l1786_c7_3e35] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1786_c7_3e35_cond <= VAR_n8_MUX_uxn_opcodes_h_l1786_c7_3e35_cond;
     n8_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue;
     n8_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output := n8_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1786_c7_3e35] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1789_c7_7850] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1786_c7_3e35] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output := result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1782_c7_4cf7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;

     -- t8_MUX[uxn_opcodes_h_l1779_c7_b499] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1779_c7_b499_cond <= VAR_t8_MUX_uxn_opcodes_h_l1779_c7_b499_cond;
     t8_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue;
     t8_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1779_c7_b499_return_output := t8_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;

     -- printf_uxn_opcodes_h_l1775_c3_d698[uxn_opcodes_h_l1775_c3_d698] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1775_c3_d698_uxn_opcodes_h_l1775_c3_d698_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1775_c3_d698_uxn_opcodes_h_l1775_c3_d698_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_7850] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1789_c7_7850] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_7850_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_7850_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_7850_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_7850_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1786_c7_3e35] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_b499] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1782_c7_4cf7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_3e35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1786_c7_3e35] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output := result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1786_c7_3e35] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1782_c7_4cf7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;

     -- t8_MUX[uxn_opcodes_h_l1774_c2_5276] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1774_c2_5276_cond <= VAR_t8_MUX_uxn_opcodes_h_l1774_c2_5276_cond;
     t8_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue;
     t8_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1774_c2_5276_return_output := t8_MUX_uxn_opcodes_h_l1774_c2_5276_return_output;

     -- n8_MUX[uxn_opcodes_h_l1782_c7_4cf7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond <= VAR_n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond;
     n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue;
     n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output := n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_3e35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1774_c2_5276_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1782_c7_4cf7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;

     -- n8_MUX[uxn_opcodes_h_l1779_c7_b499] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1779_c7_b499_cond <= VAR_n8_MUX_uxn_opcodes_h_l1779_c7_b499_cond;
     n8_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue;
     n8_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1779_c7_b499_return_output := n8_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1782_c7_4cf7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1782_c7_4cf7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1782_c7_4cf7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1779_c7_b499] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_return_output := result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1779_c7_b499] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1774_c2_5276] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_4cf7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;
     -- n8_MUX[uxn_opcodes_h_l1774_c2_5276] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1774_c2_5276_cond <= VAR_n8_MUX_uxn_opcodes_h_l1774_c2_5276_cond;
     n8_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue;
     n8_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1774_c2_5276_return_output := n8_MUX_uxn_opcodes_h_l1774_c2_5276_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1774_c2_5276] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_return_output := result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1779_c7_b499] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_return_output := result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_b499] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_b499] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1774_c2_5276] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1779_c7_b499] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1774_c2_5276_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_b499_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1774_c2_5276] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1774_c2_5276] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_return_output := result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1774_c2_5276] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1774_c2_5276] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1804_l1770_DUPLICATE_f344 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1804_l1770_DUPLICATE_f344_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_643c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_5276_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_5276_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_5276_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_5276_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_5276_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_5276_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_5276_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1804_l1770_DUPLICATE_f344_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1804_l1770_DUPLICATE_f344_return_output;
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
