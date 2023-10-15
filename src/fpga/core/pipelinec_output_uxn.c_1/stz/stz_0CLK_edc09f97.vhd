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
-- Submodules: 56
entity stz_0CLK_edc09f97 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz_0CLK_edc09f97;
architecture arch of stz_0CLK_edc09f97 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1642_c6_bd8b]
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1642_c2_91aa]
signal n8_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1642_c2_91aa]
signal t8_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c2_91aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c2_91aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c2_91aa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1642_c2_91aa]
signal result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1642_c2_91aa]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1642_c2_91aa]
signal result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c2_91aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1647_c11_7fb7]
signal BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1647_c7_6794]
signal n8_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1647_c7_6794]
signal t8_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1647_c7_6794]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1647_c7_6794]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1647_c7_6794]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1647_c7_6794]
signal result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1647_c7_6794]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1647_c7_6794]
signal result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1647_c7_6794]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1650_c11_5c18]
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1650_c7_c1f1]
signal n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1650_c7_c1f1]
signal t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1650_c7_c1f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1650_c7_c1f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1650_c7_c1f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1650_c7_c1f1]
signal result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1650_c7_c1f1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1650_c7_c1f1]
signal result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1650_c7_c1f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_e246]
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1654_c7_85f4]
signal n8_MUX_uxn_opcodes_h_l1654_c7_85f4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_85f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_85f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1654_c7_85f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1654_c7_85f4]
signal result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1654_c7_85f4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1654_c7_85f4]
signal result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_85f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1657_c11_58aa]
signal BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1657_c7_3e92]
signal n8_MUX_uxn_opcodes_h_l1657_c7_3e92_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1657_c7_3e92]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1657_c7_3e92]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1657_c7_3e92]
signal result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1657_c7_3e92]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1657_c7_3e92]
signal result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1657_c7_3e92]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1660_c32_cba2]
signal BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1660_c32_f5b9]
signal BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1660_c32_d874]
signal MUX_uxn_opcodes_h_l1660_c32_d874_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1660_c32_d874_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1660_c32_d874_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1660_c32_d874_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1665_c11_1bbb]
signal BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1665_c7_1948]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1665_c7_1948]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1665_c7_1948]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b
BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_left,
BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_right,
BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_return_output);

-- n8_MUX_uxn_opcodes_h_l1642_c2_91aa
n8_MUX_uxn_opcodes_h_l1642_c2_91aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1642_c2_91aa_cond,
n8_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue,
n8_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse,
n8_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output);

-- t8_MUX_uxn_opcodes_h_l1642_c2_91aa
t8_MUX_uxn_opcodes_h_l1642_c2_91aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1642_c2_91aa_cond,
t8_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue,
t8_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse,
t8_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa
result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_cond,
result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa
result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7
BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_left,
BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_right,
BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_return_output);

-- n8_MUX_uxn_opcodes_h_l1647_c7_6794
n8_MUX_uxn_opcodes_h_l1647_c7_6794 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1647_c7_6794_cond,
n8_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue,
n8_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse,
n8_MUX_uxn_opcodes_h_l1647_c7_6794_return_output);

-- t8_MUX_uxn_opcodes_h_l1647_c7_6794
t8_MUX_uxn_opcodes_h_l1647_c7_6794 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1647_c7_6794_cond,
t8_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue,
t8_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse,
t8_MUX_uxn_opcodes_h_l1647_c7_6794_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794
result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794
result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794
result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_cond,
result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794
result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794
result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794
result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_left,
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_right,
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_return_output);

-- n8_MUX_uxn_opcodes_h_l1650_c7_c1f1
n8_MUX_uxn_opcodes_h_l1650_c7_c1f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond,
n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue,
n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse,
n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output);

-- t8_MUX_uxn_opcodes_h_l1650_c7_c1f1
t8_MUX_uxn_opcodes_h_l1650_c7_c1f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond,
t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue,
t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse,
t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1
result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond,
result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1
result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1
result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_left,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_right,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_return_output);

-- n8_MUX_uxn_opcodes_h_l1654_c7_85f4
n8_MUX_uxn_opcodes_h_l1654_c7_85f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1654_c7_85f4_cond,
n8_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue,
n8_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse,
n8_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4
result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_cond,
result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4
result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4
result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa
BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_left,
BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_right,
BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_return_output);

-- n8_MUX_uxn_opcodes_h_l1657_c7_3e92
n8_MUX_uxn_opcodes_h_l1657_c7_3e92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1657_c7_3e92_cond,
n8_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue,
n8_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse,
n8_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92
result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92
result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92
result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_cond,
result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92
result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92
result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2
BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_left,
BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_right,
BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9
BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_left,
BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_right,
BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_return_output);

-- MUX_uxn_opcodes_h_l1660_c32_d874
MUX_uxn_opcodes_h_l1660_c32_d874 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1660_c32_d874_cond,
MUX_uxn_opcodes_h_l1660_c32_d874_iftrue,
MUX_uxn_opcodes_h_l1660_c32_d874_iffalse,
MUX_uxn_opcodes_h_l1660_c32_d874_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb
BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_left,
BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_right,
BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948
result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948
result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948
result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_return_output,
 n8_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output,
 t8_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_return_output,
 n8_MUX_uxn_opcodes_h_l1647_c7_6794_return_output,
 t8_MUX_uxn_opcodes_h_l1647_c7_6794_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_return_output,
 n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output,
 t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_return_output,
 n8_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_return_output,
 n8_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_return_output,
 MUX_uxn_opcodes_h_l1660_c32_d874_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_4fa5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_7416 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1652_c3_f6dc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1654_c7_85f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1655_c3_00b7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1654_c7_85f4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1657_c7_3e92_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1660_c32_d874_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1660_c32_d874_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1660_c32_d874_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1660_c32_d874_return_output : signed(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1662_c21_39e9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_60ee_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1665_l1654_l1650_l1647_l1642_DUPLICATE_2105_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_7980_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1665_l1654_l1650_l1647_l1642_DUPLICATE_6238_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_dc48_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1665_l1657_l1654_l1650_l1647_DUPLICATE_d1e3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1671_l1638_DUPLICATE_9cf4_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1660_c32_d874_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1660_c32_d874_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_right := to_unsigned(3, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_7416 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_7416;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_4fa5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_4fa5;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1655_c3_00b7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1655_c3_00b7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1652_c3_f6dc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1652_c3_f6dc;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue := to_unsigned(1, 1);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue := VAR_previous_stack_read;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1642_c6_bd8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_e246] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_left;
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_return_output := BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1665_c11_1bbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_7980 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_7980_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1647_c11_7fb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1654_c7_85f4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1654_c7_85f4_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1665_l1654_l1650_l1647_l1642_DUPLICATE_2105 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1665_l1654_l1650_l1647_l1642_DUPLICATE_2105_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1665_l1654_l1650_l1647_l1642_DUPLICATE_6238 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1665_l1654_l1650_l1647_l1642_DUPLICATE_6238_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_dc48 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_dc48_return_output := result.ram_addr;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1662_c21_39e9] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1662_c21_39e9_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1650_c11_5c18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_left;
     BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_return_output := BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1657_c11_58aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1660_c32_cba2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_left;
     BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_return_output := BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1665_l1657_l1654_l1650_l1647_DUPLICATE_d1e3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1665_l1657_l1654_l1650_l1647_DUPLICATE_d1e3_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_60ee LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_60ee_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_cba2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1642_c2_91aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c2_91aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_bd8b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1647_c7_6794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1647_c7_6794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_7fb7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_5c18_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1654_c7_85f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e246_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1657_c7_3e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_58aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_1bbb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1662_c21_39e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_60ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_60ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_60ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_60ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_60ee_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_dc48_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_dc48_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_dc48_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_dc48_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_dc48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1665_l1657_l1654_l1650_l1647_DUPLICATE_d1e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1665_l1657_l1654_l1650_l1647_DUPLICATE_d1e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1665_l1657_l1654_l1650_l1647_DUPLICATE_d1e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1665_l1657_l1654_l1650_l1647_DUPLICATE_d1e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1665_l1657_l1654_l1650_l1647_DUPLICATE_d1e3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1665_l1654_l1650_l1647_l1642_DUPLICATE_6238_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1665_l1654_l1650_l1647_l1642_DUPLICATE_6238_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1665_l1654_l1650_l1647_l1642_DUPLICATE_6238_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1665_l1654_l1650_l1647_l1642_DUPLICATE_6238_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1665_l1654_l1650_l1647_l1642_DUPLICATE_6238_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1665_l1654_l1650_l1647_l1642_DUPLICATE_2105_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1665_l1654_l1650_l1647_l1642_DUPLICATE_2105_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1665_l1654_l1650_l1647_l1642_DUPLICATE_2105_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1665_l1654_l1650_l1647_l1642_DUPLICATE_2105_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1665_l1654_l1650_l1647_l1642_DUPLICATE_2105_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_7980_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_7980_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_7980_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_7980_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1657_l1654_l1650_l1647_l1642_DUPLICATE_7980_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1654_c7_85f4_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1665_c7_1948] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_return_output;

     -- t8_MUX[uxn_opcodes_h_l1650_c7_c1f1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond <= VAR_t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond;
     t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue;
     t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output := t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1660_c32_f5b9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_left;
     BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_return_output := BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1665_c7_1948] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_return_output;

     -- n8_MUX[uxn_opcodes_h_l1657_c7_3e92] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1657_c7_3e92_cond <= VAR_n8_MUX_uxn_opcodes_h_l1657_c7_3e92_cond;
     n8_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue;
     n8_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output := n8_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1665_c7_1948] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_85f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1657_c7_3e92] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1657_c7_3e92] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output := result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1660_c32_d874_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_f5b9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_1948_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_1948_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_1948_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1657_c7_3e92] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1657_c7_3e92] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1650_c7_c1f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;

     -- n8_MUX[uxn_opcodes_h_l1654_c7_85f4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1654_c7_85f4_cond <= VAR_n8_MUX_uxn_opcodes_h_l1654_c7_85f4_cond;
     n8_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue;
     n8_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output := n8_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output;

     -- MUX[uxn_opcodes_h_l1660_c32_d874] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1660_c32_d874_cond <= VAR_MUX_uxn_opcodes_h_l1660_c32_d874_cond;
     MUX_uxn_opcodes_h_l1660_c32_d874_iftrue <= VAR_MUX_uxn_opcodes_h_l1660_c32_d874_iftrue;
     MUX_uxn_opcodes_h_l1660_c32_d874_iffalse <= VAR_MUX_uxn_opcodes_h_l1660_c32_d874_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1660_c32_d874_return_output := MUX_uxn_opcodes_h_l1660_c32_d874_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1657_c7_3e92] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output;

     -- t8_MUX[uxn_opcodes_h_l1647_c7_6794] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1647_c7_6794_cond <= VAR_t8_MUX_uxn_opcodes_h_l1647_c7_6794_cond;
     t8_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue;
     t8_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1647_c7_6794_return_output := t8_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1654_c7_85f4] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output := result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1654_c7_85f4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue := VAR_MUX_uxn_opcodes_h_l1660_c32_d874_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1654_c7_85f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1647_c7_6794] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;

     -- n8_MUX[uxn_opcodes_h_l1650_c7_c1f1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond <= VAR_n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond;
     n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue;
     n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output := n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1654_c7_85f4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1650_c7_c1f1] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output := result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;

     -- t8_MUX[uxn_opcodes_h_l1642_c2_91aa] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1642_c2_91aa_cond <= VAR_t8_MUX_uxn_opcodes_h_l1642_c2_91aa_cond;
     t8_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue;
     t8_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output := t8_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1650_c7_c1f1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1657_c7_3e92] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_85f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_3e92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c2_91aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1647_c7_6794] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1650_c7_c1f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1650_c7_c1f1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_85f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1650_c7_c1f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;

     -- n8_MUX[uxn_opcodes_h_l1647_c7_6794] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1647_c7_6794_cond <= VAR_n8_MUX_uxn_opcodes_h_l1647_c7_6794_cond;
     n8_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue;
     n8_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1647_c7_6794_return_output := n8_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1647_c7_6794] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_return_output := result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_85f4_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1642_c2_91aa] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1642_c2_91aa] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output := result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output;

     -- n8_MUX[uxn_opcodes_h_l1642_c2_91aa] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1642_c2_91aa_cond <= VAR_n8_MUX_uxn_opcodes_h_l1642_c2_91aa_cond;
     n8_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue;
     n8_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output := n8_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1650_c7_c1f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1647_c7_6794] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1647_c7_6794] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1647_c7_6794] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_c1f1_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1642_c2_91aa] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c2_91aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c2_91aa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1647_c7_6794] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;

     -- Submodule level 7
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_6794_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c2_91aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1671_l1638_DUPLICATE_9cf4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1671_l1638_DUPLICATE_9cf4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4841(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_91aa_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1671_l1638_DUPLICATE_9cf4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1671_l1638_DUPLICATE_9cf4_return_output;
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
