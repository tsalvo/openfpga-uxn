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
-- Submodules: 68
entity str2_0CLK_4f993427 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str2_0CLK_4f993427;
architecture arch of str2_0CLK_4f993427 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1637_c6_64dd]
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1637_c1_1602]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1637_c2_a741]
signal t8_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1637_c2_a741]
signal n16_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1637_c2_a741]
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1637_c2_a741]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c2_a741]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c2_a741]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c2_a741]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c2_a741]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1637_c2_a741]
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1638_c3_1e5f[uxn_opcodes_h_l1638_c3_1e5f]
signal printf_uxn_opcodes_h_l1638_c3_1e5f_uxn_opcodes_h_l1638_c3_1e5f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1642_c11_8fe5]
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1642_c7_102d]
signal t8_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1642_c7_102d]
signal n16_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1642_c7_102d]
signal result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1642_c7_102d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c7_102d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c7_102d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c7_102d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c7_102d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1642_c7_102d]
signal result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1645_c11_35c1]
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1645_c7_ac95]
signal t8_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1645_c7_ac95]
signal n16_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1645_c7_ac95]
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1645_c7_ac95]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1645_c7_ac95]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1645_c7_ac95]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1645_c7_ac95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1645_c7_ac95]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1645_c7_ac95]
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1649_c11_e7a9]
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1649_c7_7563]
signal n16_MUX_uxn_opcodes_h_l1649_c7_7563_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_7563_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1649_c7_7563]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1649_c7_7563]
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1649_c7_7563]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1649_c7_7563]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1649_c7_7563]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1649_c7_7563]
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1651_c3_a83f]
signal CONST_SL_8_uxn_opcodes_h_l1651_c3_a83f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1651_c3_a83f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1653_c11_31b6]
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1653_c7_44d1]
signal n16_MUX_uxn_opcodes_h_l1653_c7_44d1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1653_c7_44d1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1653_c7_44d1]
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1653_c7_44d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1653_c7_44d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1653_c7_44d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1653_c7_44d1]
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1654_c3_c7f4]
signal BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1656_c30_ec53]
signal sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1659_c31_67ea]
signal CONST_SR_8_uxn_opcodes_h_l1659_c31_67ea_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1659_c31_67ea_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1661_c11_0a12]
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c7_1e28]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1661_c7_1e28]
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c7_1e28]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c7_1e28]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1661_c7_1e28]
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1663_c22_f135]
signal BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1666_c11_b21d]
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1666_c7_d598]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1666_c7_d598]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_return_output : signed(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8efe( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd
BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_left,
BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_right,
BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_return_output);

-- t8_MUX_uxn_opcodes_h_l1637_c2_a741
t8_MUX_uxn_opcodes_h_l1637_c2_a741 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1637_c2_a741_cond,
t8_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue,
t8_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse,
t8_MUX_uxn_opcodes_h_l1637_c2_a741_return_output);

-- n16_MUX_uxn_opcodes_h_l1637_c2_a741
n16_MUX_uxn_opcodes_h_l1637_c2_a741 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1637_c2_a741_cond,
n16_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue,
n16_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse,
n16_MUX_uxn_opcodes_h_l1637_c2_a741_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_cond,
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_cond,
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_return_output);

-- printf_uxn_opcodes_h_l1638_c3_1e5f_uxn_opcodes_h_l1638_c3_1e5f
printf_uxn_opcodes_h_l1638_c3_1e5f_uxn_opcodes_h_l1638_c3_1e5f : entity work.printf_uxn_opcodes_h_l1638_c3_1e5f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1638_c3_1e5f_uxn_opcodes_h_l1638_c3_1e5f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_left,
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_right,
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_return_output);

-- t8_MUX_uxn_opcodes_h_l1642_c7_102d
t8_MUX_uxn_opcodes_h_l1642_c7_102d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1642_c7_102d_cond,
t8_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue,
t8_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse,
t8_MUX_uxn_opcodes_h_l1642_c7_102d_return_output);

-- n16_MUX_uxn_opcodes_h_l1642_c7_102d
n16_MUX_uxn_opcodes_h_l1642_c7_102d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1642_c7_102d_cond,
n16_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue,
n16_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse,
n16_MUX_uxn_opcodes_h_l1642_c7_102d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_left,
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_right,
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_return_output);

-- t8_MUX_uxn_opcodes_h_l1645_c7_ac95
t8_MUX_uxn_opcodes_h_l1645_c7_ac95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1645_c7_ac95_cond,
t8_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue,
t8_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse,
t8_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output);

-- n16_MUX_uxn_opcodes_h_l1645_c7_ac95
n16_MUX_uxn_opcodes_h_l1645_c7_ac95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1645_c7_ac95_cond,
n16_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue,
n16_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse,
n16_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_cond,
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_cond,
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_left,
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_right,
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_return_output);

-- n16_MUX_uxn_opcodes_h_l1649_c7_7563
n16_MUX_uxn_opcodes_h_l1649_c7_7563 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1649_c7_7563_cond,
n16_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue,
n16_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse,
n16_MUX_uxn_opcodes_h_l1649_c7_7563_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_cond,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_cond,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1651_c3_a83f
CONST_SL_8_uxn_opcodes_h_l1651_c3_a83f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1651_c3_a83f_x,
CONST_SL_8_uxn_opcodes_h_l1651_c3_a83f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_left,
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_right,
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_return_output);

-- n16_MUX_uxn_opcodes_h_l1653_c7_44d1
n16_MUX_uxn_opcodes_h_l1653_c7_44d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1653_c7_44d1_cond,
n16_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue,
n16_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse,
n16_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_cond,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4
BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_left,
BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_right,
BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53
sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_ins,
sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_x,
sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_y,
sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1659_c31_67ea
CONST_SR_8_uxn_opcodes_h_l1659_c31_67ea : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1659_c31_67ea_x,
CONST_SR_8_uxn_opcodes_h_l1659_c31_67ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_left,
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_right,
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_cond,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_cond,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135
BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_left,
BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_right,
BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_left,
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_right,
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_return_output,
 t8_MUX_uxn_opcodes_h_l1637_c2_a741_return_output,
 n16_MUX_uxn_opcodes_h_l1637_c2_a741_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_return_output,
 t8_MUX_uxn_opcodes_h_l1642_c7_102d_return_output,
 n16_MUX_uxn_opcodes_h_l1642_c7_102d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_return_output,
 t8_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output,
 n16_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_return_output,
 n16_MUX_uxn_opcodes_h_l1649_c7_7563_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_return_output,
 CONST_SL_8_uxn_opcodes_h_l1651_c3_a83f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_return_output,
 n16_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_return_output,
 sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_return_output,
 CONST_SR_8_uxn_opcodes_h_l1659_c31_67ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_fdb0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1638_c3_1e5f_uxn_opcodes_h_l1638_c3_1e5f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_7a12 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_7563_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_19e0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1645_c7_ac95_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_7563_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_a83f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_a83f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_44d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1658_c3_befe : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_67ea_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_67ea_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1659_c21_2e1c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1663_c3_07fa : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_return_output : signed(18 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1664_c21_95bb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_0693_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_b2ec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_4baa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1645_l1642_l1637_DUPLICATE_0642_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_1c69_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_dff5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1650_l1654_DUPLICATE_03b3_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_225a_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l1671_l1632_DUPLICATE_7269_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_fdb0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_fdb0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_7a12 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_7a12;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_19e0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_19e0;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse := n16;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_dff5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_dff5_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_b2ec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_b2ec_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1645_l1642_l1637_DUPLICATE_0642 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1645_l1642_l1637_DUPLICATE_0642_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1653_c11_31b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_4baa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_4baa_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1650_l1654_DUPLICATE_03b3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1650_l1654_DUPLICATE_03b3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1649_c11_e7a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1645_c11_35c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1661_c11_0a12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_left;
     BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_return_output := BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_1c69 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_1c69_return_output := result.u8_value;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_225a LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_225a_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1642_c11_8fe5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1664_c21_95bb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1664_c21_95bb_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1666_c11_b21d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1645_c7_ac95] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1645_c7_ac95_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1656_c30_ec53] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_ins;
     sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_x;
     sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_return_output := sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1637_c6_64dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_0693 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_0693_return_output := result.u16_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1637_c2_a741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1637_c2_a741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_64dd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_102d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c7_102d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_8fe5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_ac95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1645_c7_ac95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_35c1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_7563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_e7a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_44d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_31b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_0a12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_b21d_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_225a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1650_l1654_DUPLICATE_03b3_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_a83f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1650_l1654_DUPLICATE_03b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1664_c21_95bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1645_l1642_l1637_DUPLICATE_0642_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1645_l1642_l1637_DUPLICATE_0642_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1645_l1642_l1637_DUPLICATE_0642_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1645_l1642_l1637_DUPLICATE_0642_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1645_l1642_l1637_DUPLICATE_0642_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_0693_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_0693_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_0693_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_0693_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_0693_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_dff5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_dff5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_dff5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_dff5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_dff5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_dff5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_b2ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_b2ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_b2ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_b2ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_b2ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_b2ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_4baa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_4baa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_4baa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_4baa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_4baa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_1c69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_1c69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_1c69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_1c69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_1c69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1645_c7_ac95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ec53_return_output;
     -- t8_MUX[uxn_opcodes_h_l1645_c7_ac95] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1645_c7_ac95_cond <= VAR_t8_MUX_uxn_opcodes_h_l1645_c7_ac95_cond;
     t8_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue;
     t8_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output := t8_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1654_c3_c7f4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_left;
     BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_return_output := BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1651_c3_a83f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1651_c3_a83f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_a83f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_a83f_return_output := CONST_SL_8_uxn_opcodes_h_l1651_c3_a83f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1661_c7_1e28] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output := result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1645_c7_ac95] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1637_c1_1602] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1666_c7_d598] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1653_c7_44d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1666_c7_d598] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c7_1e28] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_67ea_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_c7f4_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1658_c3_befe := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_143c_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_a83f_return_output;
     VAR_printf_uxn_opcodes_h_l1638_c3_1e5f_uxn_opcodes_h_l1638_c3_1e5f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_1602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_d598_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_d598_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1658_c3_befe;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1653_c7_44d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1663_c22_f135] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c7_1e28] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output;

     -- printf_uxn_opcodes_h_l1638_c3_1e5f[uxn_opcodes_h_l1638_c3_1e5f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1638_c3_1e5f_uxn_opcodes_h_l1638_c3_1e5f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1638_c3_1e5f_uxn_opcodes_h_l1638_c3_1e5f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l1642_c7_102d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1642_c7_102d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1642_c7_102d_cond;
     t8_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue;
     t8_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1642_c7_102d_return_output := t8_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1659_c31_67ea] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1659_c31_67ea_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_67ea_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_67ea_return_output := CONST_SR_8_uxn_opcodes_h_l1659_c31_67ea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c7_102d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1653_c7_44d1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1653_c7_44d1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_44d1_cond;
     n16_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue;
     n16_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output := n16_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c7_1e28] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1649_c7_7563] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1663_c3_07fa := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_f135_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_7563_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1663_c3_07fa;
     -- result_u16_value_MUX[uxn_opcodes_h_l1661_c7_1e28] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output := result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1645_c7_ac95] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;

     -- t8_MUX[uxn_opcodes_h_l1637_c2_a741] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1637_c2_a741_cond <= VAR_t8_MUX_uxn_opcodes_h_l1637_c2_a741_cond;
     t8_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue;
     t8_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1637_c2_a741_return_output := t8_MUX_uxn_opcodes_h_l1637_c2_a741_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1653_c7_44d1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1649_c7_7563] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_return_output;

     -- n16_MUX[uxn_opcodes_h_l1649_c7_7563] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1649_c7_7563_cond <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_7563_cond;
     n16_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue;
     n16_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_7563_return_output := n16_MUX_uxn_opcodes_h_l1649_c7_7563_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1659_c21_2e1c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1659_c21_2e1c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_67ea_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c2_a741] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1653_c7_44d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1659_c21_2e1c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1649_c7_7563_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_7563_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_1e28_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1637_c2_a741_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1653_c7_44d1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1649_c7_7563] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_return_output;

     -- n16_MUX[uxn_opcodes_h_l1645_c7_ac95] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1645_c7_ac95_cond <= VAR_n16_MUX_uxn_opcodes_h_l1645_c7_ac95_cond;
     n16_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue;
     n16_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output := n16_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1645_c7_ac95] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1653_c7_44d1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output := result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1649_c7_7563] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c7_102d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_7563_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_7563_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_44d1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c2_a741] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_return_output;

     -- n16_MUX[uxn_opcodes_h_l1642_c7_102d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1642_c7_102d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_102d_cond;
     n16_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue;
     n16_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_102d_return_output := n16_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1645_c7_ac95] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1649_c7_7563] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_return_output := result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1649_c7_7563] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_return_output := result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c7_102d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1645_c7_ac95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_7563_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_7563_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c2_a741] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1642_c7_102d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c7_102d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1645_c7_ac95] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output := result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1645_c7_ac95] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output := result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;

     -- n16_MUX[uxn_opcodes_h_l1637_c2_a741] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1637_c2_a741_cond <= VAR_n16_MUX_uxn_opcodes_h_l1637_c2_a741_cond;
     n16_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue;
     n16_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1637_c2_a741_return_output := n16_MUX_uxn_opcodes_h_l1637_c2_a741_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1637_c2_a741_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_ac95_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1637_c2_a741] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1642_c7_102d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1642_c7_102d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c2_a741] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_102d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1637_c2_a741] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_return_output := result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1637_c2_a741] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_return_output := result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l1671_l1632_DUPLICATE_7269 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l1671_l1632_DUPLICATE_7269_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8efe(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_a741_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_a741_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_a741_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_a741_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_a741_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_a741_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_a741_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l1671_l1632_DUPLICATE_7269_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l1671_l1632_DUPLICATE_7269_return_output;
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
