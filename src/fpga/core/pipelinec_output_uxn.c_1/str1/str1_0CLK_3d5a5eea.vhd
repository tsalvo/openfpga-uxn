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
-- Submodules: 57
entity str1_0CLK_3d5a5eea is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str1_0CLK_3d5a5eea;
architecture arch of str1_0CLK_3d5a5eea is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1813_c6_5064]
signal BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1813_c2_eb74]
signal t8_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1813_c2_eb74]
signal n8_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1813_c2_eb74]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1813_c2_eb74]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1813_c2_eb74]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1813_c2_eb74]
signal result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1813_c2_eb74]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1813_c2_eb74]
signal result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1813_c2_eb74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1818_c11_02db]
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1818_c7_cbab]
signal t8_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1818_c7_cbab]
signal n8_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1818_c7_cbab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1818_c7_cbab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1818_c7_cbab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1818_c7_cbab]
signal result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1818_c7_cbab]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1818_c7_cbab]
signal result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1818_c7_cbab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1821_c11_0ae5]
signal BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1821_c7_8e59]
signal t8_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1821_c7_8e59]
signal n8_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1821_c7_8e59]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1821_c7_8e59]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1821_c7_8e59]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1821_c7_8e59]
signal result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1821_c7_8e59]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1821_c7_8e59]
signal result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1821_c7_8e59]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1825_c11_311c]
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1825_c7_0b1d]
signal n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1825_c7_0b1d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1825_c7_0b1d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1825_c7_0b1d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1825_c7_0b1d]
signal result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1825_c7_0b1d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1825_c7_0b1d]
signal result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1825_c7_0b1d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1828_c11_1828]
signal BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1828_c7_89c6]
signal n8_MUX_uxn_opcodes_h_l1828_c7_89c6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1828_c7_89c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1828_c7_89c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1828_c7_89c6]
signal result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1828_c7_89c6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1828_c7_89c6]
signal result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1828_c7_89c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1831_c32_8d67]
signal BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1831_c32_fcf2]
signal BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1831_c32_dc13]
signal MUX_uxn_opcodes_h_l1831_c32_dc13_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1831_c32_dc13_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1831_c32_dc13_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1831_c32_dc13_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1833_c21_4abe]
signal BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1836_c11_f165]
signal BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1836_c7_1a31]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1836_c7_1a31]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1836_c7_1a31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4841( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.ram_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064
BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_left,
BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_right,
BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_return_output);

-- t8_MUX_uxn_opcodes_h_l1813_c2_eb74
t8_MUX_uxn_opcodes_h_l1813_c2_eb74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1813_c2_eb74_cond,
t8_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue,
t8_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse,
t8_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output);

-- n8_MUX_uxn_opcodes_h_l1813_c2_eb74
n8_MUX_uxn_opcodes_h_l1813_c2_eb74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1813_c2_eb74_cond,
n8_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue,
n8_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse,
n8_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74
result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74
result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74
result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_cond,
result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74
result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74
result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_left,
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_right,
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_return_output);

-- t8_MUX_uxn_opcodes_h_l1818_c7_cbab
t8_MUX_uxn_opcodes_h_l1818_c7_cbab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1818_c7_cbab_cond,
t8_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue,
t8_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse,
t8_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output);

-- n8_MUX_uxn_opcodes_h_l1818_c7_cbab
n8_MUX_uxn_opcodes_h_l1818_c7_cbab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1818_c7_cbab_cond,
n8_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue,
n8_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse,
n8_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab
result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_cond,
result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab
result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab
result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5
BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_left,
BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_right,
BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_return_output);

-- t8_MUX_uxn_opcodes_h_l1821_c7_8e59
t8_MUX_uxn_opcodes_h_l1821_c7_8e59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1821_c7_8e59_cond,
t8_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue,
t8_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse,
t8_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output);

-- n8_MUX_uxn_opcodes_h_l1821_c7_8e59
n8_MUX_uxn_opcodes_h_l1821_c7_8e59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1821_c7_8e59_cond,
n8_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue,
n8_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse,
n8_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59
result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_cond,
result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59
result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_left,
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_right,
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_return_output);

-- n8_MUX_uxn_opcodes_h_l1825_c7_0b1d
n8_MUX_uxn_opcodes_h_l1825_c7_0b1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond,
n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue,
n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse,
n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d
result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond,
result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d
result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d
result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828
BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_left,
BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_right,
BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_return_output);

-- n8_MUX_uxn_opcodes_h_l1828_c7_89c6
n8_MUX_uxn_opcodes_h_l1828_c7_89c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1828_c7_89c6_cond,
n8_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue,
n8_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse,
n8_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6
result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6
result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_cond,
result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6
result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6
result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6
result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67
BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_left,
BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_right,
BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2
BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_left,
BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_right,
BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_return_output);

-- MUX_uxn_opcodes_h_l1831_c32_dc13
MUX_uxn_opcodes_h_l1831_c32_dc13 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1831_c32_dc13_cond,
MUX_uxn_opcodes_h_l1831_c32_dc13_iftrue,
MUX_uxn_opcodes_h_l1831_c32_dc13_iffalse,
MUX_uxn_opcodes_h_l1831_c32_dc13_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe
BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_left,
BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_right,
BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_left,
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_right,
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31
result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31
result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_return_output,
 t8_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output,
 n8_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_return_output,
 t8_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output,
 n8_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_return_output,
 t8_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output,
 n8_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_return_output,
 n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_return_output,
 n8_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_return_output,
 MUX_uxn_opcodes_h_l1831_c32_dc13_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_ec32 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1819_c3_7bd0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1823_c3_961c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1826_c3_1d3a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1825_c7_0b1d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1828_c7_89c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1833_c3_f5e5 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1831_c32_dc13_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1831_c32_dc13_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1831_c32_dc13_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1831_c32_dc13_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1833_c26_ca72_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_c9d4_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1821_l1818_l1813_l1836_DUPLICATE_1a8e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_0511_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1821_l1818_l1813_l1836_DUPLICATE_89d8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_d26d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1836_DUPLICATE_a602_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1843_l1809_DUPLICATE_e15f_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1819_c3_7bd0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1819_c3_7bd0;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_ec32 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_ec32;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1831_c32_dc13_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1826_c3_1d3a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1826_c3_1d3a;
     VAR_MUX_uxn_opcodes_h_l1831_c32_dc13_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1823_c3_961c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1823_c3_961c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_right := to_unsigned(0, 1);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue := VAR_previous_stack_read;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse := t8;
     -- BIN_OP_AND[uxn_opcodes_h_l1831_c32_8d67] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_left;
     BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_return_output := BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1833_c26_ca72] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1833_c26_ca72_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1821_l1818_l1813_l1836_DUPLICATE_89d8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1821_l1818_l1813_l1836_DUPLICATE_89d8_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1818_c11_02db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_left;
     BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_return_output := BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1825_c11_311c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_c9d4 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_c9d4_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_d26d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_d26d_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1821_l1818_l1813_l1836_DUPLICATE_1a8e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1821_l1818_l1813_l1836_DUPLICATE_1a8e_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1825_c7_0b1d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1825_c7_0b1d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1836_DUPLICATE_a602 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1836_DUPLICATE_a602_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1821_c11_0ae5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_0511 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_0511_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1828_c11_1828] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_left;
     BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_return_output := BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1836_c11_f165] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_left;
     BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_return_output := BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1813_c6_5064] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_left;
     BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_return_output := BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_8d67_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1813_c2_eb74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1813_c2_eb74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_5064_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1818_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1818_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_02db_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1821_c7_8e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1821_c7_8e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_0ae5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_311c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1828_c7_89c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_1828_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_f165_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1833_c26_ca72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_c9d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_c9d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_c9d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_c9d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_c9d4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_d26d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_d26d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_d26d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_d26d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_d26d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1836_DUPLICATE_a602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1836_DUPLICATE_a602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1836_DUPLICATE_a602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1836_DUPLICATE_a602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1836_DUPLICATE_a602_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1821_l1818_l1813_l1836_DUPLICATE_89d8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1821_l1818_l1813_l1836_DUPLICATE_89d8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1821_l1818_l1813_l1836_DUPLICATE_89d8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1821_l1818_l1813_l1836_DUPLICATE_89d8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1825_l1821_l1818_l1813_l1836_DUPLICATE_89d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1821_l1818_l1813_l1836_DUPLICATE_1a8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1821_l1818_l1813_l1836_DUPLICATE_1a8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1821_l1818_l1813_l1836_DUPLICATE_1a8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1821_l1818_l1813_l1836_DUPLICATE_1a8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1825_l1821_l1818_l1813_l1836_DUPLICATE_1a8e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_0511_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_0511_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_0511_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_0511_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1828_l1825_l1821_l1818_l1813_DUPLICATE_0511_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1825_c7_0b1d_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1828_c7_89c6] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output := result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1836_c7_1a31] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1831_c32_fcf2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_left;
     BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_return_output := BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1836_c7_1a31] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1833_c21_4abe] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1836_c7_1a31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1825_c7_0b1d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1828_c7_89c6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1828_c7_89c6_cond <= VAR_n8_MUX_uxn_opcodes_h_l1828_c7_89c6_cond;
     n8_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue;
     n8_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output := n8_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1821_c7_8e59] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1821_c7_8e59_cond <= VAR_t8_MUX_uxn_opcodes_h_l1821_c7_8e59_cond;
     t8_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue;
     t8_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output := t8_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1831_c32_dc13_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_fcf2_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1833_c3_f5e5 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_4abe_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_1a31_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1833_c3_f5e5;
     -- n8_MUX[uxn_opcodes_h_l1825_c7_0b1d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond;
     n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue;
     n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output := n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1828_c7_89c6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1828_c7_89c6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1821_c7_8e59] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1828_c7_89c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1825_c7_0b1d] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output := result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1818_c7_cbab] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1818_c7_cbab_cond <= VAR_t8_MUX_uxn_opcodes_h_l1818_c7_cbab_cond;
     t8_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue;
     t8_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output := t8_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1828_c7_89c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output;

     -- MUX[uxn_opcodes_h_l1831_c32_dc13] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1831_c32_dc13_cond <= VAR_MUX_uxn_opcodes_h_l1831_c32_dc13_cond;
     MUX_uxn_opcodes_h_l1831_c32_dc13_iftrue <= VAR_MUX_uxn_opcodes_h_l1831_c32_dc13_iftrue;
     MUX_uxn_opcodes_h_l1831_c32_dc13_iffalse <= VAR_MUX_uxn_opcodes_h_l1831_c32_dc13_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1831_c32_dc13_return_output := MUX_uxn_opcodes_h_l1831_c32_dc13_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue := VAR_MUX_uxn_opcodes_h_l1831_c32_dc13_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1828_c7_89c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1818_c7_cbab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1821_c7_8e59] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output := result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;

     -- n8_MUX[uxn_opcodes_h_l1821_c7_8e59] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1821_c7_8e59_cond <= VAR_n8_MUX_uxn_opcodes_h_l1821_c7_8e59_cond;
     n8_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue;
     n8_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output := n8_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1825_c7_0b1d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1825_c7_0b1d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1825_c7_0b1d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1813_c2_eb74] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1813_c2_eb74_cond <= VAR_t8_MUX_uxn_opcodes_h_l1813_c2_eb74_cond;
     t8_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue;
     t8_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output := t8_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1825_c7_0b1d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_89c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1813_c2_eb74] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1821_c7_8e59] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1825_c7_0b1d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1821_c7_8e59] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;

     -- n8_MUX[uxn_opcodes_h_l1818_c7_cbab] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1818_c7_cbab_cond <= VAR_n8_MUX_uxn_opcodes_h_l1818_c7_cbab_cond;
     n8_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue;
     n8_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output := n8_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1821_c7_8e59] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1818_c7_cbab] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output := result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1821_c7_8e59] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_0b1d_return_output;
     -- n8_MUX[uxn_opcodes_h_l1813_c2_eb74] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1813_c2_eb74_cond <= VAR_n8_MUX_uxn_opcodes_h_l1813_c2_eb74_cond;
     n8_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue;
     n8_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output := n8_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1818_c7_cbab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1821_c7_8e59] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1818_c7_cbab] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1813_c2_eb74] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output := result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1818_c7_cbab] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1818_c7_cbab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_8e59_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1813_c2_eb74] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1818_c7_cbab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1813_c2_eb74] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1813_c2_eb74] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1813_c2_eb74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output;

     -- Submodule level 7
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_cbab_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1813_c2_eb74] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1843_l1809_DUPLICATE_e15f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1843_l1809_DUPLICATE_e15f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4841(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_eb74_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1843_l1809_DUPLICATE_e15f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1843_l1809_DUPLICATE_e15f_return_output;
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
