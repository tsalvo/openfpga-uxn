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
-- Submodules: 64
entity str1_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str1_0CLK_7c2e709f;
architecture arch of str1_0CLK_7c2e709f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1883_c6_b015]
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1883_c1_16f5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1883_c2_ea2e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1883_c2_ea2e]
signal result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1883_c2_ea2e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1883_c2_ea2e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1883_c2_ea2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1883_c2_ea2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1883_c2_ea2e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1883_c2_ea2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1883_c2_ea2e]
signal t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1883_c2_ea2e]
signal n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1884_c3_031e[uxn_opcodes_h_l1884_c3_031e]
signal printf_uxn_opcodes_h_l1884_c3_031e_uxn_opcodes_h_l1884_c3_031e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1889_c11_f62b]
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1889_c7_2657]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1889_c7_2657]
signal result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1889_c7_2657]
signal result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1889_c7_2657]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1889_c7_2657]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1889_c7_2657]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1889_c7_2657]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1889_c7_2657]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1889_c7_2657]
signal t8_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1889_c7_2657]
signal n8_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1892_c11_fa5d]
signal BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1892_c7_b86b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1892_c7_b86b]
signal result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1892_c7_b86b]
signal result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1892_c7_b86b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1892_c7_b86b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1892_c7_b86b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1892_c7_b86b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1892_c7_b86b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1892_c7_b86b]
signal t8_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1892_c7_b86b]
signal n8_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1896_c11_cffc]
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1896_c7_ac68]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1896_c7_ac68]
signal result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1896_c7_ac68]
signal result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1896_c7_ac68]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1896_c7_ac68]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1896_c7_ac68]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1896_c7_ac68]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1896_c7_ac68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1896_c7_ac68]
signal n8_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1899_c11_da55]
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1899_c7_2282]
signal result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1899_c7_2282]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1899_c7_2282]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1899_c7_2282]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1899_c7_2282]
signal result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1899_c7_2282]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1899_c7_2282]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1899_c7_2282]
signal n8_MUX_uxn_opcodes_h_l1899_c7_2282_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1899_c7_2282_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1903_c32_73e8]
signal BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1903_c32_872e]
signal BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1903_c32_6f0c]
signal MUX_uxn_opcodes_h_l1903_c32_6f0c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1903_c32_6f0c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1903_c32_6f0c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1903_c32_6f0c_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1905_c21_6a77]
signal BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1908_c11_3ebb]
signal BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1908_c7_a4db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1908_c7_a4db]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1908_c7_a4db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_475e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.ram_value := ref_toks_2;
      base.ram_addr := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015
BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_left,
BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_right,
BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e
result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e
result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond,
result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e
result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e
result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e
result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output);

-- t8_MUX_uxn_opcodes_h_l1883_c2_ea2e
t8_MUX_uxn_opcodes_h_l1883_c2_ea2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond,
t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue,
t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse,
t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output);

-- n8_MUX_uxn_opcodes_h_l1883_c2_ea2e
n8_MUX_uxn_opcodes_h_l1883_c2_ea2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond,
n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue,
n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse,
n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output);

-- printf_uxn_opcodes_h_l1884_c3_031e_uxn_opcodes_h_l1884_c3_031e
printf_uxn_opcodes_h_l1884_c3_031e_uxn_opcodes_h_l1884_c3_031e : entity work.printf_uxn_opcodes_h_l1884_c3_031e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1884_c3_031e_uxn_opcodes_h_l1884_c3_031e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_left,
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_right,
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657
result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657
result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_cond,
result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657
result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657
result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657
result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657
result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_return_output);

-- t8_MUX_uxn_opcodes_h_l1889_c7_2657
t8_MUX_uxn_opcodes_h_l1889_c7_2657 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1889_c7_2657_cond,
t8_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue,
t8_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse,
t8_MUX_uxn_opcodes_h_l1889_c7_2657_return_output);

-- n8_MUX_uxn_opcodes_h_l1889_c7_2657
n8_MUX_uxn_opcodes_h_l1889_c7_2657 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1889_c7_2657_cond,
n8_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue,
n8_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse,
n8_MUX_uxn_opcodes_h_l1889_c7_2657_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_left,
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_right,
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b
result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b
result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_cond,
result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b
result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b
result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b
result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output);

-- t8_MUX_uxn_opcodes_h_l1892_c7_b86b
t8_MUX_uxn_opcodes_h_l1892_c7_b86b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1892_c7_b86b_cond,
t8_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue,
t8_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse,
t8_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output);

-- n8_MUX_uxn_opcodes_h_l1892_c7_b86b
n8_MUX_uxn_opcodes_h_l1892_c7_b86b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1892_c7_b86b_cond,
n8_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue,
n8_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse,
n8_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_left,
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_right,
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68
result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68
result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_cond,
result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68
result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68
result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68
result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output);

-- n8_MUX_uxn_opcodes_h_l1896_c7_ac68
n8_MUX_uxn_opcodes_h_l1896_c7_ac68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1896_c7_ac68_cond,
n8_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue,
n8_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse,
n8_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_left,
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_right,
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282
result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282
result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282
result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_cond,
result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282
result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_return_output);

-- n8_MUX_uxn_opcodes_h_l1899_c7_2282
n8_MUX_uxn_opcodes_h_l1899_c7_2282 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1899_c7_2282_cond,
n8_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue,
n8_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse,
n8_MUX_uxn_opcodes_h_l1899_c7_2282_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8
BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_left,
BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_right,
BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e
BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_left,
BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_right,
BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_return_output);

-- MUX_uxn_opcodes_h_l1903_c32_6f0c
MUX_uxn_opcodes_h_l1903_c32_6f0c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1903_c32_6f0c_cond,
MUX_uxn_opcodes_h_l1903_c32_6f0c_iftrue,
MUX_uxn_opcodes_h_l1903_c32_6f0c_iffalse,
MUX_uxn_opcodes_h_l1903_c32_6f0c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77
BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_left,
BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_right,
BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb
BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_left,
BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_right,
BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db
result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db
result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db
result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output,
 t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output,
 n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_return_output,
 t8_MUX_uxn_opcodes_h_l1889_c7_2657_return_output,
 n8_MUX_uxn_opcodes_h_l1889_c7_2657_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output,
 t8_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output,
 n8_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output,
 n8_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_return_output,
 n8_MUX_uxn_opcodes_h_l1899_c7_2282_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_return_output,
 MUX_uxn_opcodes_h_l1903_c32_6f0c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_c29f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1889_c7_2657_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1884_c3_031e_uxn_opcodes_h_l1884_c3_031e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1890_c3_f1dd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1889_c7_2657_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1894_c3_f062 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1892_c7_b86b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1897_c3_fc24 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1896_c7_ac68_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1899_c7_2282_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1896_c7_ac68_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1905_c3_0bb9 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1899_c7_2282_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1903_c32_6f0c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1903_c32_6f0c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1903_c32_6f0c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1903_c32_6f0c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1905_c26_8d16_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_18ea_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_0ec7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1908_DUPLICATE_9ed9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_653f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1908_DUPLICATE_84bf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1892_l1896_l1889_l1899_DUPLICATE_2a79_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1908_l1899_DUPLICATE_057d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1915_l1879_DUPLICATE_dba9_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_c29f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_c29f;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1903_c32_6f0c_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1903_c32_6f0c_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_iffalse := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1894_c3_f062 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1894_c3_f062;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1897_c3_fc24 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1897_c3_fc24;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1890_c3_f1dd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1890_c3_f1dd;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue := VAR_previous_stack_read;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse := t8;
     -- BIN_OP_AND[uxn_opcodes_h_l1903_c32_73e8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_left;
     BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_return_output := BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1908_DUPLICATE_9ed9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1908_DUPLICATE_9ed9_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1908_l1899_DUPLICATE_057d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1908_l1899_DUPLICATE_057d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1883_c6_b015] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_left;
     BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_return_output := BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1905_c26_8d16] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1905_c26_8d16_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_18ea LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_18ea_return_output := result.ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1892_l1896_l1889_l1899_DUPLICATE_2a79 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1892_l1896_l1889_l1899_DUPLICATE_2a79_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1892_c11_fa5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1908_DUPLICATE_84bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1908_DUPLICATE_84bf_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1896_c11_cffc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1896_c7_ac68] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1896_c7_ac68_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_653f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_653f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1908_c11_3ebb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1899_c11_da55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_left;
     BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_return_output := BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1889_c11_f62b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_0ec7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_0ec7_return_output := result.ram_addr;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1903_c32_73e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c6_b015_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1889_c7_2657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1889_c7_2657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_f62b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1892_c7_b86b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1892_c7_b86b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_fa5d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1896_c7_ac68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_cffc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1899_c7_2282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_da55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_3ebb_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1905_c26_8d16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_653f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_653f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_653f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_653f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_653f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_0ec7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_0ec7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_0ec7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_0ec7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_0ec7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1908_l1899_DUPLICATE_057d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1908_l1899_DUPLICATE_057d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1908_l1899_DUPLICATE_057d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1908_l1899_DUPLICATE_057d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1908_l1899_DUPLICATE_057d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1908_DUPLICATE_84bf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1908_DUPLICATE_84bf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1908_DUPLICATE_84bf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1908_DUPLICATE_84bf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1908_DUPLICATE_84bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1908_DUPLICATE_9ed9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1908_DUPLICATE_9ed9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1908_DUPLICATE_9ed9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1908_DUPLICATE_9ed9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1908_DUPLICATE_9ed9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1892_l1896_l1889_l1899_DUPLICATE_2a79_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1892_l1896_l1889_l1899_DUPLICATE_2a79_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1892_l1896_l1889_l1899_DUPLICATE_2a79_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1892_l1896_l1889_l1899_DUPLICATE_2a79_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_18ea_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_18ea_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_18ea_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_18ea_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1896_l1892_l1889_l1883_l1899_DUPLICATE_18ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1896_c7_ac68_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1903_c32_872e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_left;
     BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_return_output := BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1905_c21_6a77] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_return_output;

     -- t8_MUX[uxn_opcodes_h_l1892_c7_b86b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1892_c7_b86b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1892_c7_b86b_cond;
     t8_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue;
     t8_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output := t8_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1899_c7_2282] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_return_output := result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_return_output;

     -- n8_MUX[uxn_opcodes_h_l1899_c7_2282] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1899_c7_2282_cond <= VAR_n8_MUX_uxn_opcodes_h_l1899_c7_2282_cond;
     n8_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue;
     n8_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1899_c7_2282_return_output := n8_MUX_uxn_opcodes_h_l1899_c7_2282_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1896_c7_ac68] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1883_c1_16f5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1908_c7_a4db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1908_c7_a4db] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1899_c7_2282] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1908_c7_a4db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1903_c32_6f0c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1903_c32_872e_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1905_c3_0bb9 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1905_c21_6a77_return_output)),16);
     VAR_printf_uxn_opcodes_h_l1884_c3_031e_uxn_opcodes_h_l1884_c3_031e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1883_c1_16f5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1899_c7_2282_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_a4db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_2282_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1899_c7_2282_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1905_c3_0bb9;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1892_c7_b86b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1899_c7_2282] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1899_c7_2282] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1899_c7_2282] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1896_c7_ac68] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;

     -- n8_MUX[uxn_opcodes_h_l1896_c7_ac68] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1896_c7_ac68_cond <= VAR_n8_MUX_uxn_opcodes_h_l1896_c7_ac68_cond;
     n8_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue;
     n8_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output := n8_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1896_c7_ac68] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output := result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;

     -- t8_MUX[uxn_opcodes_h_l1889_c7_2657] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1889_c7_2657_cond <= VAR_t8_MUX_uxn_opcodes_h_l1889_c7_2657_cond;
     t8_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue;
     t8_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1889_c7_2657_return_output := t8_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1899_c7_2282] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_return_output;

     -- MUX[uxn_opcodes_h_l1903_c32_6f0c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1903_c32_6f0c_cond <= VAR_MUX_uxn_opcodes_h_l1903_c32_6f0c_cond;
     MUX_uxn_opcodes_h_l1903_c32_6f0c_iftrue <= VAR_MUX_uxn_opcodes_h_l1903_c32_6f0c_iftrue;
     MUX_uxn_opcodes_h_l1903_c32_6f0c_iffalse <= VAR_MUX_uxn_opcodes_h_l1903_c32_6f0c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1903_c32_6f0c_return_output := MUX_uxn_opcodes_h_l1903_c32_6f0c_return_output;

     -- printf_uxn_opcodes_h_l1884_c3_031e[uxn_opcodes_h_l1884_c3_031e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1884_c3_031e_uxn_opcodes_h_l1884_c3_031e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1884_c3_031e_uxn_opcodes_h_l1884_c3_031e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue := VAR_MUX_uxn_opcodes_h_l1903_c32_6f0c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_2282_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1899_c7_2282_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_2282_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1899_c7_2282_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1896_c7_ac68] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;

     -- t8_MUX[uxn_opcodes_h_l1883_c2_ea2e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond;
     t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue;
     t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output := t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1892_c7_b86b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1899_c7_2282] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1892_c7_b86b] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output := result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;

     -- n8_MUX[uxn_opcodes_h_l1892_c7_b86b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1892_c7_b86b_cond <= VAR_n8_MUX_uxn_opcodes_h_l1892_c7_b86b_cond;
     n8_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue;
     n8_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output := n8_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1896_c7_ac68] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1889_c7_2657] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1896_c7_ac68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1896_c7_ac68] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_2282_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1889_c7_2657] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_return_output := result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1892_c7_b86b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1889_c7_2657] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1896_c7_ac68] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1892_c7_b86b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1883_c2_ea2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1889_c7_2657] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1889_c7_2657_cond <= VAR_n8_MUX_uxn_opcodes_h_l1889_c7_2657_cond;
     n8_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue;
     n8_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1889_c7_2657_return_output := n8_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1892_c7_b86b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1892_c7_b86b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_ac68_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1889_c7_2657] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1883_c2_ea2e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1892_c7_b86b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;

     -- n8_MUX[uxn_opcodes_h_l1883_c2_ea2e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond;
     n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue;
     n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output := n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1883_c2_ea2e] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output := result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1889_c7_2657] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1889_c7_2657] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1889_c7_2657] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_b86b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1889_c7_2657] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1883_c2_ea2e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1883_c2_ea2e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1883_c2_ea2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1883_c2_ea2e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output;

     -- Submodule level 7
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1889_c7_2657_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1883_c2_ea2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1915_l1879_DUPLICATE_dba9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1915_l1879_DUPLICATE_dba9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_475e(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c2_ea2e_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1915_l1879_DUPLICATE_dba9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1915_l1879_DUPLICATE_dba9_return_output;
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
