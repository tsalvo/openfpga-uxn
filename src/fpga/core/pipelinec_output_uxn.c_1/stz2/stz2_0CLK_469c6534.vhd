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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 85
entity stz2_0CLK_469c6534 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_469c6534;
architecture arch of stz2_0CLK_469c6534 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1644_c6_e068]
signal BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1644_c2_ddf4]
signal n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1644_c2_ddf4]
signal t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1644_c2_ddf4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1644_c2_ddf4]
signal result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1644_c2_ddf4]
signal result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1644_c2_ddf4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1644_c2_ddf4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1644_c2_ddf4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1644_c2_ddf4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1649_c11_dd30]
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1649_c7_464c]
signal n16_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1649_c7_464c]
signal t8_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1649_c7_464c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1649_c7_464c]
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1649_c7_464c]
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1649_c7_464c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1649_c7_464c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1649_c7_464c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1649_c7_464c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1652_c11_3ad4]
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1652_c7_5cb4]
signal n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1652_c7_5cb4]
signal t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1652_c7_5cb4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1652_c7_5cb4]
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1652_c7_5cb4]
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1652_c7_5cb4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1652_c7_5cb4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1652_c7_5cb4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1652_c7_5cb4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1656_c11_3cea]
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1656_c7_a247]
signal n16_MUX_uxn_opcodes_h_l1656_c7_a247_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_a247_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c7_a247]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1656_c7_a247]
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1656_c7_a247]
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c7_a247]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1656_c7_a247]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c7_a247]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1656_c7_a247]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1659_c11_2da4]
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1659_c7_dbe8]
signal n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1659_c7_dbe8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1659_c7_dbe8]
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1659_c7_dbe8]
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1659_c7_dbe8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1659_c7_dbe8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1659_c7_dbe8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1659_c7_dbe8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1661_c3_f00d]
signal CONST_SL_8_uxn_opcodes_h_l1661_c3_f00d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1661_c3_f00d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1664_c11_4642]
signal BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1664_c7_93ce]
signal n16_MUX_uxn_opcodes_h_l1664_c7_93ce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1664_c7_93ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1664_c7_93ce]
signal result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1664_c7_93ce]
signal result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1664_c7_93ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1664_c7_93ce]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1664_c7_93ce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1664_c7_93ce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1667_c11_bdec]
signal BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1667_c7_aa32]
signal n16_MUX_uxn_opcodes_h_l1667_c7_aa32_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1667_c7_aa32]
signal result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1667_c7_aa32]
signal result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1667_c7_aa32]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1667_c7_aa32]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1667_c7_aa32]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1667_c7_aa32]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1668_c3_2849]
signal BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1670_c30_e8d4]
signal sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1673_c31_4f88]
signal CONST_SR_8_uxn_opcodes_h_l1673_c31_4f88_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1673_c31_4f88_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1675_c11_14ca]
signal BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1675_c7_1d7f]
signal result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1675_c7_1d7f]
signal result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1675_c7_1d7f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1675_c7_1d7f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1675_c7_1d7f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1677_c33_7535]
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1680_c11_933e]
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1680_c7_5a85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1680_c7_5a85]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_sp_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068
BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_left,
BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_right,
BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_return_output);

-- n16_MUX_uxn_opcodes_h_l1644_c2_ddf4
n16_MUX_uxn_opcodes_h_l1644_c2_ddf4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond,
n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue,
n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse,
n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output);

-- t8_MUX_uxn_opcodes_h_l1644_c2_ddf4
t8_MUX_uxn_opcodes_h_l1644_c2_ddf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond,
t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue,
t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse,
t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4
result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4
result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4
result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4
result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4
result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_left,
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_right,
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_return_output);

-- n16_MUX_uxn_opcodes_h_l1649_c7_464c
n16_MUX_uxn_opcodes_h_l1649_c7_464c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1649_c7_464c_cond,
n16_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue,
n16_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse,
n16_MUX_uxn_opcodes_h_l1649_c7_464c_return_output);

-- t8_MUX_uxn_opcodes_h_l1649_c7_464c
t8_MUX_uxn_opcodes_h_l1649_c7_464c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1649_c7_464c_cond,
t8_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue,
t8_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse,
t8_MUX_uxn_opcodes_h_l1649_c7_464c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_left,
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_right,
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_return_output);

-- n16_MUX_uxn_opcodes_h_l1652_c7_5cb4
n16_MUX_uxn_opcodes_h_l1652_c7_5cb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond,
n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue,
n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse,
n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output);

-- t8_MUX_uxn_opcodes_h_l1652_c7_5cb4
t8_MUX_uxn_opcodes_h_l1652_c7_5cb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond,
t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue,
t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse,
t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4
result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_left,
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_right,
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_return_output);

-- n16_MUX_uxn_opcodes_h_l1656_c7_a247
n16_MUX_uxn_opcodes_h_l1656_c7_a247 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1656_c7_a247_cond,
n16_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue,
n16_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse,
n16_MUX_uxn_opcodes_h_l1656_c7_a247_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_cond,
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_cond,
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_left,
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_right,
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_return_output);

-- n16_MUX_uxn_opcodes_h_l1659_c7_dbe8
n16_MUX_uxn_opcodes_h_l1659_c7_dbe8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond,
n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue,
n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse,
n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8
result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8
result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1661_c3_f00d
CONST_SL_8_uxn_opcodes_h_l1661_c3_f00d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1661_c3_f00d_x,
CONST_SL_8_uxn_opcodes_h_l1661_c3_f00d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642
BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_left,
BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_right,
BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_return_output);

-- n16_MUX_uxn_opcodes_h_l1664_c7_93ce
n16_MUX_uxn_opcodes_h_l1664_c7_93ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1664_c7_93ce_cond,
n16_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue,
n16_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse,
n16_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_cond,
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_cond,
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce
result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce
result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce
result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec
BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_left,
BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_right,
BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_return_output);

-- n16_MUX_uxn_opcodes_h_l1667_c7_aa32
n16_MUX_uxn_opcodes_h_l1667_c7_aa32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1667_c7_aa32_cond,
n16_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue,
n16_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse,
n16_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32
result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_cond,
result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32
result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_cond,
result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32
result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32
result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32
result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32
result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849
BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_left,
BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_right,
BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4
sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_ins,
sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_x,
sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_y,
sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1673_c31_4f88
CONST_SR_8_uxn_opcodes_h_l1673_c31_4f88 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1673_c31_4f88_x,
CONST_SR_8_uxn_opcodes_h_l1673_c31_4f88_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca
BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_left,
BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_right,
BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f
result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f
result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f
result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f
result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f
result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535
BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_left,
BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_right,
BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e
BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_left,
BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_right,
BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85
result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_return_output,
 n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output,
 t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_return_output,
 n16_MUX_uxn_opcodes_h_l1649_c7_464c_return_output,
 t8_MUX_uxn_opcodes_h_l1649_c7_464c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_return_output,
 n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output,
 t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_return_output,
 n16_MUX_uxn_opcodes_h_l1656_c7_a247_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_return_output,
 n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output,
 CONST_SL_8_uxn_opcodes_h_l1661_c3_f00d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_return_output,
 n16_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_return_output,
 n16_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_return_output,
 sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_return_output,
 CONST_SR_8_uxn_opcodes_h_l1673_c31_4f88_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1646_c3_db25 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1650_c3_dcd9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_a247_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_40cd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_a247_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1657_c3_aa12 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1662_c3_b18c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1661_c3_f00d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1661_c3_f00d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1664_c7_93ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_1acf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1664_c7_93ce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1667_c7_aa32_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1672_c22_a69b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1673_c31_4f88_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1673_c31_4f88_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1673_c21_2a58_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1677_c22_eedb_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1678_c21_2fd6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_0947_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_c943_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1644_DUPLICATE_ff3d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1644_l1667_DUPLICATE_a416_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_8e05_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1667_DUPLICATE_fff3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1660_l1668_DUPLICATE_177f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1685_l1638_DUPLICATE_35eb_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1650_c3_dcd9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1650_c3_dcd9;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1657_c3_aa12 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1657_c3_aa12;
     VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1662_c3_b18c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1662_c3_b18c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1646_c3_db25 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1646_c3_db25;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_40cd := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_40cd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_1acf := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_1acf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1667_DUPLICATE_fff3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1667_DUPLICATE_fff3_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1680_c11_933e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1670_c30_e8d4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_ins;
     sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_x;
     sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_return_output := sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1664_c7_93ce] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1664_c7_93ce_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1656_c11_3cea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_left;
     BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_return_output := BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1677_c33_7535] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1644_DUPLICATE_ff3d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1644_DUPLICATE_ff3d_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1649_c11_dd30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_left;
     BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_return_output := BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1659_c11_2da4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1675_c11_14ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_0947 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_0947_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1660_l1668_DUPLICATE_177f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1660_l1668_DUPLICATE_177f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_c943 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_c943_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1652_c11_3ad4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1678_c21_2fd6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1678_c21_2fd6_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1644_l1667_DUPLICATE_a416 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1644_l1667_DUPLICATE_a416_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1644_c6_e068] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_left;
     BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_return_output := BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1672_c22_a69b] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1672_c22_a69b_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1667_c11_bdec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_8e05 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_8e05_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1664_c11_4642] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_left;
     BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_return_output := BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c6_e068_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_464c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1649_c7_464c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_dd30_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_3ad4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_a247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3cea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2da4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1664_c7_93ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_4642_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1667_c7_aa32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_bdec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_14ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_933e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1672_c22_a69b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1660_l1668_DUPLICATE_177f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1661_c3_f00d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1660_l1668_DUPLICATE_177f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1678_c21_2fd6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1644_l1667_DUPLICATE_a416_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1644_l1667_DUPLICATE_a416_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1644_l1667_DUPLICATE_a416_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1644_l1667_DUPLICATE_a416_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1644_l1667_DUPLICATE_a416_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1644_l1667_DUPLICATE_a416_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1644_l1667_DUPLICATE_a416_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_c943_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_c943_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_c943_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_c943_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_c943_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_c943_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_c943_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1667_DUPLICATE_fff3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1667_DUPLICATE_fff3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1667_DUPLICATE_fff3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1667_DUPLICATE_fff3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1667_DUPLICATE_fff3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1667_DUPLICATE_fff3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1667_DUPLICATE_fff3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1667_DUPLICATE_fff3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1644_DUPLICATE_ff3d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1644_DUPLICATE_ff3d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1644_DUPLICATE_ff3d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1644_DUPLICATE_ff3d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1644_DUPLICATE_ff3d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1644_DUPLICATE_ff3d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1644_DUPLICATE_ff3d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1680_l1649_l1675_l1644_DUPLICATE_ff3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_8e05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_8e05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_8e05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_8e05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_8e05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_8e05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_8e05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_0947_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_0947_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_0947_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_0947_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_0947_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_0947_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1652_l1649_l1675_l1644_DUPLICATE_0947_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1664_c7_93ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_e8d4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1667_c7_aa32] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1677_c22_eedb] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1677_c22_eedb_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c33_7535_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1664_c7_93ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1675_c7_1d7f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1668_c3_2849] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_left;
     BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_return_output := BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1661_c3_f00d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1661_c3_f00d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1661_c3_f00d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1661_c3_f00d_return_output := CONST_SL_8_uxn_opcodes_h_l1661_c3_f00d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1675_c7_1d7f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1680_c7_5a85] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_return_output;

     -- t8_MUX[uxn_opcodes_h_l1652_c7_5cb4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond;
     t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue;
     t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output := t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1680_c7_5a85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1673_c31_4f88_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1668_c3_2849_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1677_c22_eedb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1661_c3_f00d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_5a85_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c7_5a85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1667_c7_aa32] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1659_c7_dbe8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1673_c31_4f88] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1673_c31_4f88_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1673_c31_4f88_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1673_c31_4f88_return_output := CONST_SR_8_uxn_opcodes_h_l1673_c31_4f88_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1675_c7_1d7f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1649_c7_464c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1649_c7_464c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1649_c7_464c_cond;
     t8_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue;
     t8_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1649_c7_464c_return_output := t8_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1664_c7_93ce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output;

     -- n16_MUX[uxn_opcodes_h_l1667_c7_aa32] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1667_c7_aa32_cond <= VAR_n16_MUX_uxn_opcodes_h_l1667_c7_aa32_cond;
     n16_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue;
     n16_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output := n16_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1675_c7_1d7f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1675_c7_1d7f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1675_c7_1d7f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1664_c7_93ce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1667_c7_aa32] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1659_c7_dbe8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c7_a247] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1673_c21_2a58] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1673_c21_2a58_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1673_c31_4f88_return_output);

     -- t8_MUX[uxn_opcodes_h_l1644_c2_ddf4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond;
     t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue;
     t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output := t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1667_c7_aa32] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1667_c7_aa32] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output := result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output;

     -- n16_MUX[uxn_opcodes_h_l1664_c7_93ce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1664_c7_93ce_cond <= VAR_n16_MUX_uxn_opcodes_h_l1664_c7_93ce_cond;
     n16_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue;
     n16_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output := n16_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1673_c21_2a58_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_a247_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1664_c7_93ce] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output := result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1652_c7_5cb4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1667_c7_aa32] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output := result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c7_a247] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1664_c7_93ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output;

     -- n16_MUX[uxn_opcodes_h_l1659_c7_dbe8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond;
     n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue;
     n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output := n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1659_c7_dbe8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1664_c7_93ce] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_a247_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_aa32_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1656_c7_a247] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1664_c7_93ce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output := result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1659_c7_dbe8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1656_c7_a247] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1656_c7_a247_cond <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_a247_cond;
     n16_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue;
     n16_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_a247_return_output := n16_MUX_uxn_opcodes_h_l1656_c7_a247_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1649_c7_464c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1652_c7_5cb4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1659_c7_dbe8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1659_c7_dbe8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1656_c7_a247_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_a247_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_93ce_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1656_c7_a247] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1652_c7_5cb4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c7_a247] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_return_output;

     -- n16_MUX[uxn_opcodes_h_l1652_c7_5cb4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond;
     n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue;
     n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output := n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1659_c7_dbe8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1644_c2_ddf4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1649_c7_464c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1656_c7_a247] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_return_output := result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_a247_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_a247_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_a247_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_dbe8_return_output;
     -- n16_MUX[uxn_opcodes_h_l1649_c7_464c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1649_c7_464c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_464c_cond;
     n16_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue;
     n16_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_464c_return_output := n16_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1652_c7_5cb4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1652_c7_5cb4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1652_c7_5cb4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1644_c2_ddf4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1649_c7_464c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1656_c7_a247] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_return_output := result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_a247_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1644_c2_ddf4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1649_c7_464c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1649_c7_464c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1652_c7_5cb4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1644_c2_ddf4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond;
     n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue;
     n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output := n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1649_c7_464c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_5cb4_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1644_c2_ddf4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1649_c7_464c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1644_c2_ddf4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1644_c2_ddf4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_464c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1644_c2_ddf4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1685_l1638_DUPLICATE_35eb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1685_l1638_DUPLICATE_35eb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c2_ddf4_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1685_l1638_DUPLICATE_35eb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1685_l1638_DUPLICATE_35eb_return_output;
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
