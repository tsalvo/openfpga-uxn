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
entity add_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add_0CLK_fd2391e7;
architecture arch of add_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l688_c6_5528]
signal BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l688_c1_c5d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l688_c2_ee7e]
signal t8_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l688_c2_ee7e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l688_c2_ee7e]
signal result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c2_ee7e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l688_c2_ee7e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l688_c2_ee7e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c2_ee7e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l688_c2_ee7e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l688_c2_ee7e]
signal n8_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l689_c3_3a67[uxn_opcodes_h_l689_c3_3a67]
signal printf_uxn_opcodes_h_l689_c3_3a67_uxn_opcodes_h_l689_c3_3a67_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l694_c11_26f0]
signal BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l694_c7_50db]
signal t8_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l694_c7_50db_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l694_c7_50db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l694_c7_50db]
signal result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l694_c7_50db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l694_c7_50db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l694_c7_50db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l694_c7_50db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l694_c7_50db]
signal result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l694_c7_50db]
signal n8_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c7_50db_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l697_c11_037c]
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l697_c7_5023]
signal t8_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l697_c7_5023_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l697_c7_5023]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l697_c7_5023]
signal result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l697_c7_5023]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l697_c7_5023]
signal result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l697_c7_5023]
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l697_c7_5023]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l697_c7_5023]
signal result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l697_c7_5023]
signal n8_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l697_c7_5023_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l701_c11_25bc]
signal BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l701_c7_bbbe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l701_c7_bbbe]
signal result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l701_c7_bbbe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l701_c7_bbbe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l701_c7_bbbe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l701_c7_bbbe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l701_c7_bbbe]
signal result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l701_c7_bbbe]
signal n8_MUX_uxn_opcodes_h_l701_c7_bbbe_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l704_c11_bdf5]
signal BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l704_c7_c252]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l704_c7_c252]
signal result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l704_c7_c252]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l704_c7_c252]
signal result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l704_c7_c252]
signal result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l704_c7_c252]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l704_c7_c252]
signal result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l704_c7_c252]
signal n8_MUX_uxn_opcodes_h_l704_c7_c252_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l704_c7_c252_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l704_c7_c252_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l704_c7_c252_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l708_c32_7d56]
signal BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l708_c32_4dbe]
signal BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l708_c32_0aea]
signal MUX_uxn_opcodes_h_l708_c32_0aea_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l708_c32_0aea_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l708_c32_0aea_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l708_c32_0aea_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l710_c11_1518]
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l710_c7_43a0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l710_c7_43a0]
signal result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l710_c7_43a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l710_c7_43a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l710_c7_43a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l714_c24_2f41]
signal BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l716_c11_e4f2]
signal BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l716_c7_41d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l716_c7_41d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528
BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_left,
BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_right,
BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_return_output);

-- t8_MUX_uxn_opcodes_h_l688_c2_ee7e
t8_MUX_uxn_opcodes_h_l688_c2_ee7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l688_c2_ee7e_cond,
t8_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue,
t8_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse,
t8_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e
result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_cond,
result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e
result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e
result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e
result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output);

-- n8_MUX_uxn_opcodes_h_l688_c2_ee7e
n8_MUX_uxn_opcodes_h_l688_c2_ee7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l688_c2_ee7e_cond,
n8_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue,
n8_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse,
n8_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output);

-- printf_uxn_opcodes_h_l689_c3_3a67_uxn_opcodes_h_l689_c3_3a67
printf_uxn_opcodes_h_l689_c3_3a67_uxn_opcodes_h_l689_c3_3a67 : entity work.printf_uxn_opcodes_h_l689_c3_3a67_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l689_c3_3a67_uxn_opcodes_h_l689_c3_3a67_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0
BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_left,
BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_right,
BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_return_output);

-- t8_MUX_uxn_opcodes_h_l694_c7_50db
t8_MUX_uxn_opcodes_h_l694_c7_50db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l694_c7_50db_cond,
t8_MUX_uxn_opcodes_h_l694_c7_50db_iftrue,
t8_MUX_uxn_opcodes_h_l694_c7_50db_iffalse,
t8_MUX_uxn_opcodes_h_l694_c7_50db_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db
result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db
result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_cond,
result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db
result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db
result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_return_output);

-- n8_MUX_uxn_opcodes_h_l694_c7_50db
n8_MUX_uxn_opcodes_h_l694_c7_50db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l694_c7_50db_cond,
n8_MUX_uxn_opcodes_h_l694_c7_50db_iftrue,
n8_MUX_uxn_opcodes_h_l694_c7_50db_iffalse,
n8_MUX_uxn_opcodes_h_l694_c7_50db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c
BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_left,
BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_right,
BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_return_output);

-- t8_MUX_uxn_opcodes_h_l697_c7_5023
t8_MUX_uxn_opcodes_h_l697_c7_5023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l697_c7_5023_cond,
t8_MUX_uxn_opcodes_h_l697_c7_5023_iftrue,
t8_MUX_uxn_opcodes_h_l697_c7_5023_iffalse,
t8_MUX_uxn_opcodes_h_l697_c7_5023_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023
result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_cond,
result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023
result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023
result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_return_output);

-- n8_MUX_uxn_opcodes_h_l697_c7_5023
n8_MUX_uxn_opcodes_h_l697_c7_5023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l697_c7_5023_cond,
n8_MUX_uxn_opcodes_h_l697_c7_5023_iftrue,
n8_MUX_uxn_opcodes_h_l697_c7_5023_iffalse,
n8_MUX_uxn_opcodes_h_l697_c7_5023_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc
BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_left,
BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_right,
BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe
result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe
result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_cond,
result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe
result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe
result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output);

-- n8_MUX_uxn_opcodes_h_l701_c7_bbbe
n8_MUX_uxn_opcodes_h_l701_c7_bbbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l701_c7_bbbe_cond,
n8_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue,
n8_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse,
n8_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5
BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_left,
BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_right,
BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252
result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_cond,
result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252
result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252
result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_return_output);

-- n8_MUX_uxn_opcodes_h_l704_c7_c252
n8_MUX_uxn_opcodes_h_l704_c7_c252 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l704_c7_c252_cond,
n8_MUX_uxn_opcodes_h_l704_c7_c252_iftrue,
n8_MUX_uxn_opcodes_h_l704_c7_c252_iffalse,
n8_MUX_uxn_opcodes_h_l704_c7_c252_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56
BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_left,
BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_right,
BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe
BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_left,
BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_right,
BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_return_output);

-- MUX_uxn_opcodes_h_l708_c32_0aea
MUX_uxn_opcodes_h_l708_c32_0aea : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l708_c32_0aea_cond,
MUX_uxn_opcodes_h_l708_c32_0aea_iftrue,
MUX_uxn_opcodes_h_l708_c32_0aea_iffalse,
MUX_uxn_opcodes_h_l708_c32_0aea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518
BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_left,
BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_right,
BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0
result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0
result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_cond,
result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0
result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41
BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_left,
BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_right,
BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2
BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_left,
BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_right,
BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9
result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9
result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_return_output,
 t8_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output,
 n8_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_return_output,
 t8_MUX_uxn_opcodes_h_l694_c7_50db_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_return_output,
 n8_MUX_uxn_opcodes_h_l694_c7_50db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_return_output,
 t8_MUX_uxn_opcodes_h_l697_c7_5023_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_return_output,
 n8_MUX_uxn_opcodes_h_l697_c7_5023_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output,
 n8_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_return_output,
 n8_MUX_uxn_opcodes_h_l704_c7_c252_return_output,
 BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_return_output,
 BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_return_output,
 MUX_uxn_opcodes_h_l708_c32_0aea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l694_c7_50db_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l691_c3_30ce : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c7_50db_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c2_ee7e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l689_c3_3a67_uxn_opcodes_h_l689_c3_3a67_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l697_c7_5023_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l695_c3_f0e8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c7_50db_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c7_50db_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_5023_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c7_50db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l699_c3_c9b7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_5023_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_5023_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_5023_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l702_c3_9a19 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l704_c7_c252_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l701_c7_bbbe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l704_c7_c252_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l704_c7_c252_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l704_c7_c252_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l708_c32_0aea_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l708_c32_0aea_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l708_c32_0aea_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l708_c32_0aea_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l714_c3_c69d : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l713_c3_e17d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l701_l688_l694_l710_l697_DUPLICATE_2a26_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l701_l704_l688_l694_l710_l697_DUPLICATE_219d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l701_l704_l688_l694_l697_DUPLICATE_8fff_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l701_l704_l688_l716_l694_l697_DUPLICATE_d254_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l701_l704_l716_l694_l710_l697_DUPLICATE_e039_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l694_l704_l697_l701_DUPLICATE_4b18_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l710_l704_DUPLICATE_e07e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l721_l684_DUPLICATE_4515_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l691_c3_30ce := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l691_c3_30ce;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l708_c32_0aea_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l695_c3_f0e8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l695_c3_f0e8;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l708_c32_0aea_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l702_c3_9a19 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l702_c3_9a19;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l699_c3_c9b7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l699_c3_c9b7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l713_c3_e17d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l713_c3_e17d;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l694_c7_50db_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_5023_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l704_c7_c252_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l704_c7_c252_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l697_c7_5023_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l694_c7_50db_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l697_c7_5023_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l704_c11_bdf5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_left;
     BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_return_output := BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l694_l704_l697_l701_DUPLICATE_4b18 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l694_l704_l697_l701_DUPLICATE_4b18_return_output := result.is_stack_read;

     -- BIN_OP_PLUS[uxn_opcodes_h_l714_c24_2f41] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_left;
     BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_return_output := BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l701_l704_l688_l694_l710_l697_DUPLICATE_219d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l701_l704_l688_l694_l710_l697_DUPLICATE_219d_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l701_c11_25bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l694_c11_26f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l710_c11_1518] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_left;
     BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_return_output := BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l688_c6_5528] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_left;
     BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_return_output := BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l708_c32_7d56] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_left;
     BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_return_output := BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l710_l704_DUPLICATE_e07e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l710_l704_DUPLICATE_e07e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l716_c11_e4f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l697_c11_037c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_left;
     BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_return_output := BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l701_l704_l688_l694_l697_DUPLICATE_8fff LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l701_l704_l688_l694_l697_DUPLICATE_8fff_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l701_l704_l688_l716_l694_l697_DUPLICATE_d254 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l701_l704_l688_l716_l694_l697_DUPLICATE_d254_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l701_l688_l694_l710_l697_DUPLICATE_2a26 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l701_l688_l694_l710_l697_DUPLICATE_2a26_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l701_l704_l716_l694_l710_l697_DUPLICATE_e039 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l701_l704_l716_l694_l710_l697_DUPLICATE_e039_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_left := VAR_BIN_OP_AND_uxn_opcodes_h_l708_c32_7d56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l688_c2_ee7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l688_c2_ee7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_5528_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l694_c7_50db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l694_c7_50db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_26f0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_5023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l697_c7_5023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_037c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l701_c7_bbbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_25bc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l704_c7_c252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_bdf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_1518_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_e4f2_return_output;
     VAR_result_stack_value_uxn_opcodes_h_l714_c3_c69d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l714_c24_2f41_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l701_l704_l688_l694_l697_DUPLICATE_8fff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l701_l704_l688_l694_l697_DUPLICATE_8fff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l701_l704_l688_l694_l697_DUPLICATE_8fff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l701_l704_l688_l694_l697_DUPLICATE_8fff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l701_l704_l688_l694_l697_DUPLICATE_8fff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l701_l704_l716_l694_l710_l697_DUPLICATE_e039_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l701_l704_l716_l694_l710_l697_DUPLICATE_e039_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l701_l704_l716_l694_l710_l697_DUPLICATE_e039_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l701_l704_l716_l694_l710_l697_DUPLICATE_e039_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l701_l704_l716_l694_l710_l697_DUPLICATE_e039_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l701_l704_l716_l694_l710_l697_DUPLICATE_e039_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l701_l688_l694_l710_l697_DUPLICATE_2a26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l701_l688_l694_l710_l697_DUPLICATE_2a26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l701_l688_l694_l710_l697_DUPLICATE_2a26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l701_l688_l694_l710_l697_DUPLICATE_2a26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l701_l688_l694_l710_l697_DUPLICATE_2a26_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l694_l704_l697_l701_DUPLICATE_4b18_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l694_l704_l697_l701_DUPLICATE_4b18_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l694_l704_l697_l701_DUPLICATE_4b18_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l694_l704_l697_l701_DUPLICATE_4b18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l701_l704_l688_l716_l694_l697_DUPLICATE_d254_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l701_l704_l688_l716_l694_l697_DUPLICATE_d254_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l701_l704_l688_l716_l694_l697_DUPLICATE_d254_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l701_l704_l688_l716_l694_l697_DUPLICATE_d254_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l701_l704_l688_l716_l694_l697_DUPLICATE_d254_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l701_l704_l688_l716_l694_l697_DUPLICATE_d254_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l710_l704_DUPLICATE_e07e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l710_l704_DUPLICATE_e07e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l701_l704_l688_l694_l710_l697_DUPLICATE_219d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l701_l704_l688_l694_l710_l697_DUPLICATE_219d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l701_l704_l688_l694_l710_l697_DUPLICATE_219d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l701_l704_l688_l694_l710_l697_DUPLICATE_219d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l701_l704_l688_l694_l710_l697_DUPLICATE_219d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l701_l704_l688_l694_l710_l697_DUPLICATE_219d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue := VAR_result_stack_value_uxn_opcodes_h_l714_c3_c69d;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l710_c7_43a0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l688_c1_c5d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l716_c7_41d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l716_c7_41d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l704_c7_c252] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_return_output;

     -- n8_MUX[uxn_opcodes_h_l704_c7_c252] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l704_c7_c252_cond <= VAR_n8_MUX_uxn_opcodes_h_l704_c7_c252_cond;
     n8_MUX_uxn_opcodes_h_l704_c7_c252_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l704_c7_c252_iftrue;
     n8_MUX_uxn_opcodes_h_l704_c7_c252_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l704_c7_c252_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l704_c7_c252_return_output := n8_MUX_uxn_opcodes_h_l704_c7_c252_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l710_c7_43a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_return_output;

     -- t8_MUX[uxn_opcodes_h_l697_c7_5023] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l697_c7_5023_cond <= VAR_t8_MUX_uxn_opcodes_h_l697_c7_5023_cond;
     t8_MUX_uxn_opcodes_h_l697_c7_5023_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l697_c7_5023_iftrue;
     t8_MUX_uxn_opcodes_h_l697_c7_5023_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l697_c7_5023_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l697_c7_5023_return_output := t8_MUX_uxn_opcodes_h_l697_c7_5023_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l710_c7_43a0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_return_output := result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l708_c32_4dbe] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_left;
     BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_return_output := BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l708_c32_0aea_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l708_c32_4dbe_return_output;
     VAR_printf_uxn_opcodes_h_l689_c3_3a67_uxn_opcodes_h_l689_c3_3a67_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_c5d4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse := VAR_n8_MUX_uxn_opcodes_h_l704_c7_c252_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_41d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_43a0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l704_c7_c252_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l716_c7_41d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_43a0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l710_c7_43a0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l694_c7_50db_iffalse := VAR_t8_MUX_uxn_opcodes_h_l697_c7_5023_return_output;
     -- n8_MUX[uxn_opcodes_h_l701_c7_bbbe] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l701_c7_bbbe_cond <= VAR_n8_MUX_uxn_opcodes_h_l701_c7_bbbe_cond;
     n8_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue;
     n8_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output := n8_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l704_c7_c252] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l701_c7_bbbe] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output;

     -- MUX[uxn_opcodes_h_l708_c32_0aea] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l708_c32_0aea_cond <= VAR_MUX_uxn_opcodes_h_l708_c32_0aea_cond;
     MUX_uxn_opcodes_h_l708_c32_0aea_iftrue <= VAR_MUX_uxn_opcodes_h_l708_c32_0aea_iftrue;
     MUX_uxn_opcodes_h_l708_c32_0aea_iffalse <= VAR_MUX_uxn_opcodes_h_l708_c32_0aea_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l708_c32_0aea_return_output := MUX_uxn_opcodes_h_l708_c32_0aea_return_output;

     -- t8_MUX[uxn_opcodes_h_l694_c7_50db] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l694_c7_50db_cond <= VAR_t8_MUX_uxn_opcodes_h_l694_c7_50db_cond;
     t8_MUX_uxn_opcodes_h_l694_c7_50db_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l694_c7_50db_iftrue;
     t8_MUX_uxn_opcodes_h_l694_c7_50db_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l694_c7_50db_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l694_c7_50db_return_output := t8_MUX_uxn_opcodes_h_l694_c7_50db_return_output;

     -- printf_uxn_opcodes_h_l689_c3_3a67[uxn_opcodes_h_l689_c3_3a67] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l689_c3_3a67_uxn_opcodes_h_l689_c3_3a67_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l689_c3_3a67_uxn_opcodes_h_l689_c3_3a67_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l710_c7_43a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l704_c7_c252] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l710_c7_43a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l704_c7_c252] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_cond;
     result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_return_output := result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_iftrue := VAR_MUX_uxn_opcodes_h_l708_c32_0aea_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_5023_iffalse := VAR_n8_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_43a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_c252_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c7_43a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_c252_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_c252_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l694_c7_50db_return_output;
     -- t8_MUX[uxn_opcodes_h_l688_c2_ee7e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l688_c2_ee7e_cond <= VAR_t8_MUX_uxn_opcodes_h_l688_c2_ee7e_cond;
     t8_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue;
     t8_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output := t8_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l701_c7_bbbe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l704_c7_c252] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l697_c7_5023] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l704_c7_c252] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_return_output;

     -- n8_MUX[uxn_opcodes_h_l697_c7_5023] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l697_c7_5023_cond <= VAR_n8_MUX_uxn_opcodes_h_l697_c7_5023_cond;
     n8_MUX_uxn_opcodes_h_l697_c7_5023_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l697_c7_5023_iftrue;
     n8_MUX_uxn_opcodes_h_l697_c7_5023_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l697_c7_5023_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_5023_return_output := n8_MUX_uxn_opcodes_h_l697_c7_5023_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l704_c7_c252] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l701_c7_bbbe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output := result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l701_c7_bbbe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l694_c7_50db_iffalse := VAR_n8_MUX_uxn_opcodes_h_l697_c7_5023_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_c252_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_5023_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_c252_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_c252_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l694_c7_50db] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l697_c7_5023] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_cond;
     result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_return_output := result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l701_c7_bbbe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l697_c7_5023] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l701_c7_bbbe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output;

     -- n8_MUX[uxn_opcodes_h_l694_c7_50db] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l694_c7_50db_cond <= VAR_n8_MUX_uxn_opcodes_h_l694_c7_50db_cond;
     n8_MUX_uxn_opcodes_h_l694_c7_50db_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l694_c7_50db_iftrue;
     n8_MUX_uxn_opcodes_h_l694_c7_50db_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l694_c7_50db_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l694_c7_50db_return_output := n8_MUX_uxn_opcodes_h_l694_c7_50db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l697_c7_5023] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l701_c7_bbbe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l694_c7_50db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_5023_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l694_c7_50db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l701_c7_bbbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_5023_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_5023_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l697_c7_5023] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l694_c7_50db] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_cond;
     result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_return_output := result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l688_c2_ee7e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l694_c7_50db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_return_output;

     -- n8_MUX[uxn_opcodes_h_l688_c2_ee7e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l688_c2_ee7e_cond <= VAR_n8_MUX_uxn_opcodes_h_l688_c2_ee7e_cond;
     n8_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue;
     n8_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output := n8_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l697_c7_5023] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l697_c7_5023] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l694_c7_50db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_5023_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l694_c7_50db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_5023_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_5023_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c7_50db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l694_c7_50db_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c2_ee7e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l694_c7_50db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l688_c2_ee7e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l694_c7_50db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l694_c7_50db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l688_c2_ee7e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output := result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_50db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c7_50db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_50db_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c2_ee7e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l688_c2_ee7e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l688_c2_ee7e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l721_l684_DUPLICATE_4515 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l721_l684_DUPLICATE_4515_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c2_ee7e_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l721_l684_DUPLICATE_4515_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l721_l684_DUPLICATE_4515_return_output;
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
