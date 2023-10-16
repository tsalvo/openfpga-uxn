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
-- Submodules: 54
entity jcn_0CLK_b288bfb7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn_0CLK_b288bfb7;
architecture arch of jcn_0CLK_b288bfb7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l685_c6_8a58]
signal BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l685_c1_aa71]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l685_c2_7705]
signal n8_MUX_uxn_opcodes_h_l685_c2_7705_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l685_c2_7705_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l685_c2_7705_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l685_c2_7705_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l685_c2_7705]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l685_c2_7705]
signal result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l685_c2_7705]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l685_c2_7705]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l685_c2_7705]
signal result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l685_c2_7705]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l685_c2_7705]
signal t8_MUX_uxn_opcodes_h_l685_c2_7705_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l685_c2_7705_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l685_c2_7705_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l685_c2_7705_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l686_c3_fe33[uxn_opcodes_h_l686_c3_fe33]
signal printf_uxn_opcodes_h_l686_c3_fe33_uxn_opcodes_h_l686_c3_fe33_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l690_c11_684b]
signal BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l690_c7_0cd6]
signal n8_MUX_uxn_opcodes_h_l690_c7_0cd6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l690_c7_0cd6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l690_c7_0cd6]
signal result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l690_c7_0cd6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l690_c7_0cd6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l690_c7_0cd6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l690_c7_0cd6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l690_c7_0cd6]
signal t8_MUX_uxn_opcodes_h_l690_c7_0cd6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l693_c11_a51a]
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l693_c7_37f4]
signal n8_MUX_uxn_opcodes_h_l693_c7_37f4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c7_37f4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c7_37f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l693_c7_37f4]
signal result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c7_37f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l693_c7_37f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l693_c7_37f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c7_37f4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l693_c7_37f4]
signal t8_MUX_uxn_opcodes_h_l693_c7_37f4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l693_c7_37f4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l697_c11_0dec]
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l697_c7_b46e]
signal n8_MUX_uxn_opcodes_h_l697_c7_b46e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l697_c7_b46e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l697_c7_b46e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l697_c7_b46e]
signal result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l697_c7_b46e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l697_c7_b46e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l697_c7_b46e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l697_c7_b46e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l700_c11_dedd]
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l700_c7_4f03]
signal n8_MUX_uxn_opcodes_h_l700_c7_4f03_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l700_c7_4f03_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l700_c7_4f03]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l700_c7_4f03]
signal result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l700_c7_4f03]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l700_c7_4f03]
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l700_c7_4f03]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l703_c30_cf05]
signal sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l705_c22_1142]
signal BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l705_c37_96c8]
signal BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l705_c22_1085]
signal MUX_uxn_opcodes_h_l705_c22_1085_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l705_c22_1085_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l705_c22_1085_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l705_c22_1085_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l707_c11_8a91]
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l707_c7_a028]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l707_c7_a028]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l707_c7_a028]
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fc62( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_pc_updated := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58
BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_left,
BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_right,
BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_return_output);

-- n8_MUX_uxn_opcodes_h_l685_c2_7705
n8_MUX_uxn_opcodes_h_l685_c2_7705 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l685_c2_7705_cond,
n8_MUX_uxn_opcodes_h_l685_c2_7705_iftrue,
n8_MUX_uxn_opcodes_h_l685_c2_7705_iffalse,
n8_MUX_uxn_opcodes_h_l685_c2_7705_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705
result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705
result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_cond,
result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705
result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705
result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_return_output);

-- t8_MUX_uxn_opcodes_h_l685_c2_7705
t8_MUX_uxn_opcodes_h_l685_c2_7705 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l685_c2_7705_cond,
t8_MUX_uxn_opcodes_h_l685_c2_7705_iftrue,
t8_MUX_uxn_opcodes_h_l685_c2_7705_iffalse,
t8_MUX_uxn_opcodes_h_l685_c2_7705_return_output);

-- printf_uxn_opcodes_h_l686_c3_fe33_uxn_opcodes_h_l686_c3_fe33
printf_uxn_opcodes_h_l686_c3_fe33_uxn_opcodes_h_l686_c3_fe33 : entity work.printf_uxn_opcodes_h_l686_c3_fe33_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l686_c3_fe33_uxn_opcodes_h_l686_c3_fe33_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b
BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_left,
BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_right,
BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_return_output);

-- n8_MUX_uxn_opcodes_h_l690_c7_0cd6
n8_MUX_uxn_opcodes_h_l690_c7_0cd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l690_c7_0cd6_cond,
n8_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue,
n8_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse,
n8_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6
result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_cond,
result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output);

-- t8_MUX_uxn_opcodes_h_l690_c7_0cd6
t8_MUX_uxn_opcodes_h_l690_c7_0cd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l690_c7_0cd6_cond,
t8_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue,
t8_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse,
t8_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a
BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_left,
BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_right,
BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_return_output);

-- n8_MUX_uxn_opcodes_h_l693_c7_37f4
n8_MUX_uxn_opcodes_h_l693_c7_37f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l693_c7_37f4_cond,
n8_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue,
n8_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse,
n8_MUX_uxn_opcodes_h_l693_c7_37f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4
result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_cond,
result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_return_output);

-- t8_MUX_uxn_opcodes_h_l693_c7_37f4
t8_MUX_uxn_opcodes_h_l693_c7_37f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l693_c7_37f4_cond,
t8_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue,
t8_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse,
t8_MUX_uxn_opcodes_h_l693_c7_37f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec
BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_left,
BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_right,
BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_return_output);

-- n8_MUX_uxn_opcodes_h_l697_c7_b46e
n8_MUX_uxn_opcodes_h_l697_c7_b46e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l697_c7_b46e_cond,
n8_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue,
n8_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse,
n8_MUX_uxn_opcodes_h_l697_c7_b46e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e
result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_cond,
result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd
BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_left,
BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_right,
BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_return_output);

-- n8_MUX_uxn_opcodes_h_l700_c7_4f03
n8_MUX_uxn_opcodes_h_l700_c7_4f03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l700_c7_4f03_cond,
n8_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue,
n8_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse,
n8_MUX_uxn_opcodes_h_l700_c7_4f03_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03
result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_cond,
result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_return_output);

-- sp_relative_shift_uxn_opcodes_h_l703_c30_cf05
sp_relative_shift_uxn_opcodes_h_l703_c30_cf05 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_ins,
sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_x,
sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_y,
sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142
BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_left,
BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_right,
BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8
BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_left,
BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_right,
BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_return_output);

-- MUX_uxn_opcodes_h_l705_c22_1085
MUX_uxn_opcodes_h_l705_c22_1085 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l705_c22_1085_cond,
MUX_uxn_opcodes_h_l705_c22_1085_iftrue,
MUX_uxn_opcodes_h_l705_c22_1085_iffalse,
MUX_uxn_opcodes_h_l705_c22_1085_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91
BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_left,
BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_right,
BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_return_output,
 n8_MUX_uxn_opcodes_h_l685_c2_7705_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_return_output,
 t8_MUX_uxn_opcodes_h_l685_c2_7705_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_return_output,
 n8_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output,
 t8_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_return_output,
 n8_MUX_uxn_opcodes_h_l693_c7_37f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_return_output,
 t8_MUX_uxn_opcodes_h_l693_c7_37f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_return_output,
 n8_MUX_uxn_opcodes_h_l697_c7_b46e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_return_output,
 n8_MUX_uxn_opcodes_h_l700_c7_4f03_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_return_output,
 sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_return_output,
 MUX_uxn_opcodes_h_l705_c22_1085_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l685_c2_7705_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l685_c2_7705_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l685_c2_7705_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l685_c2_7705_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_36e2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l685_c2_7705_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l685_c2_7705_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l685_c2_7705_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l685_c2_7705_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l686_c3_fe33_uxn_opcodes_h_l686_c3_fe33_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c7_37f4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l690_c7_0cd6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l691_c3_ffc1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l693_c7_37f4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l690_c7_0cd6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_b46e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c7_37f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l695_c3_dec3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l693_c7_37f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_4f03_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_b46e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_2711 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l697_c7_b46e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_4f03_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l705_c22_1085_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l705_c22_1085_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l705_c22_1085_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l705_c42_7193_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l705_c22_1085_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l690_l693_l700_l685_l697_DUPLICATE_9e62_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l690_l693_l700_l685_l697_DUPLICATE_1bbe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l690_l707_l693_l685_l697_DUPLICATE_15ea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l690_l707_l693_l685_l697_DUPLICATE_ee53_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l690_l707_l693_l700_l697_DUPLICATE_4d8f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fc62_uxn_opcodes_h_l713_l681_DUPLICATE_c854_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_36e2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_36e2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l695_c3_dec3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l695_c3_dec3;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l691_c3_ffc1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l691_c3_ffc1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_2711 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_2711;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l685_c2_7705_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l705_c22_1085_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l685_c2_7705_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l690_l707_l693_l685_l697_DUPLICATE_ee53 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l690_l707_l693_l685_l697_DUPLICATE_ee53_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l690_l693_l700_l685_l697_DUPLICATE_1bbe LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l690_l693_l700_l685_l697_DUPLICATE_1bbe_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l693_c11_a51a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_left;
     BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_return_output := BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l707_c11_8a91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_left;
     BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_return_output := BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l685_c6_8a58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_left;
     BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_return_output := BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l690_c11_684b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_left;
     BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_return_output := BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l697_c7_b46e] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l697_c7_b46e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l700_c11_dedd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_left;
     BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_return_output := BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l697_c11_0dec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_left;
     BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_return_output := BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l705_c42_7193] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l705_c42_7193_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l690_l693_l700_l685_l697_DUPLICATE_9e62 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l690_l693_l700_l685_l697_DUPLICATE_9e62_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l690_l707_l693_l685_l697_DUPLICATE_15ea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l690_l707_l693_l685_l697_DUPLICATE_15ea_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l690_l707_l693_l700_l697_DUPLICATE_4d8f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l690_l707_l693_l700_l697_DUPLICATE_4d8f_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l703_c30_cf05] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_ins;
     sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_x <= VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_x;
     sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_y <= VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_return_output := sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l705_c22_1142] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_left;
     BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_return_output := BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l685_c2_7705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l685_c2_7705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_8a58_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l690_c7_0cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l690_c7_0cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_684b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l693_c7_37f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l693_c7_37f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a51a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_b46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_0dec_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_4f03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_dedd_return_output;
     VAR_MUX_uxn_opcodes_h_l705_c22_1085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_1142_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_8a91_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l705_c42_7193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l690_l693_l700_l685_l697_DUPLICATE_9e62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l690_l693_l700_l685_l697_DUPLICATE_9e62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l690_l693_l700_l685_l697_DUPLICATE_9e62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l690_l693_l700_l685_l697_DUPLICATE_9e62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l690_l693_l700_l685_l697_DUPLICATE_9e62_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l690_l693_l700_l685_l697_DUPLICATE_1bbe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l690_l693_l700_l685_l697_DUPLICATE_1bbe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l690_l693_l700_l685_l697_DUPLICATE_1bbe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l690_l693_l700_l685_l697_DUPLICATE_1bbe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l690_l693_l700_l685_l697_DUPLICATE_1bbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l690_l707_l693_l700_l697_DUPLICATE_4d8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l690_l707_l693_l700_l697_DUPLICATE_4d8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l690_l707_l693_l700_l697_DUPLICATE_4d8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l690_l707_l693_l700_l697_DUPLICATE_4d8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l690_l707_l693_l700_l697_DUPLICATE_4d8f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l690_l707_l693_l685_l697_DUPLICATE_ee53_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l690_l707_l693_l685_l697_DUPLICATE_ee53_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l690_l707_l693_l685_l697_DUPLICATE_ee53_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l690_l707_l693_l685_l697_DUPLICATE_ee53_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l690_l707_l693_l685_l697_DUPLICATE_ee53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l690_l707_l693_l685_l697_DUPLICATE_15ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l690_l707_l693_l685_l697_DUPLICATE_15ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l690_l707_l693_l685_l697_DUPLICATE_15ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l690_l707_l693_l685_l697_DUPLICATE_15ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l690_l707_l693_l685_l697_DUPLICATE_15ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l697_c7_b46e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_cf05_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l707_c7_a028] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l705_c37_96c8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_return_output;

     -- t8_MUX[uxn_opcodes_h_l693_c7_37f4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l693_c7_37f4_cond <= VAR_t8_MUX_uxn_opcodes_h_l693_c7_37f4_cond;
     t8_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue;
     t8_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l693_c7_37f4_return_output := t8_MUX_uxn_opcodes_h_l693_c7_37f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l697_c7_b46e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l707_c7_a028] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_return_output;

     -- n8_MUX[uxn_opcodes_h_l700_c7_4f03] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l700_c7_4f03_cond <= VAR_n8_MUX_uxn_opcodes_h_l700_c7_4f03_cond;
     n8_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue;
     n8_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_4f03_return_output := n8_MUX_uxn_opcodes_h_l700_c7_4f03_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l700_c7_4f03] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l685_c1_aa71] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l707_c7_a028] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l705_c22_1085_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_96c8_return_output)),16);
     VAR_printf_uxn_opcodes_h_l686_c3_fe33_uxn_opcodes_h_l686_c3_fe33_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_aa71_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l700_c7_4f03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_a028_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_a028_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_a028_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4f03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_b46e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l693_c7_37f4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c7_37f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_return_output;

     -- n8_MUX[uxn_opcodes_h_l697_c7_b46e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l697_c7_b46e_cond <= VAR_n8_MUX_uxn_opcodes_h_l697_c7_b46e_cond;
     n8_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue;
     n8_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_b46e_return_output := n8_MUX_uxn_opcodes_h_l697_c7_b46e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l700_c7_4f03] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_return_output;

     -- printf_uxn_opcodes_h_l686_c3_fe33[uxn_opcodes_h_l686_c3_fe33] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l686_c3_fe33_uxn_opcodes_h_l686_c3_fe33_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l686_c3_fe33_uxn_opcodes_h_l686_c3_fe33_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l690_c7_0cd6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l690_c7_0cd6_cond <= VAR_t8_MUX_uxn_opcodes_h_l690_c7_0cd6_cond;
     t8_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue;
     t8_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output := t8_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l697_c7_b46e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l700_c7_4f03] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l700_c7_4f03] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_return_output;

     -- MUX[uxn_opcodes_h_l705_c22_1085] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l705_c22_1085_cond <= VAR_MUX_uxn_opcodes_h_l705_c22_1085_cond;
     MUX_uxn_opcodes_h_l705_c22_1085_iftrue <= VAR_MUX_uxn_opcodes_h_l705_c22_1085_iftrue;
     MUX_uxn_opcodes_h_l705_c22_1085_iffalse <= VAR_MUX_uxn_opcodes_h_l705_c22_1085_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l705_c22_1085_return_output := MUX_uxn_opcodes_h_l705_c22_1085_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue := VAR_MUX_uxn_opcodes_h_l705_c22_1085_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l697_c7_b46e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4f03_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4f03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4f03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_b46e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_37f4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l685_c2_7705_iffalse := VAR_t8_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l700_c7_4f03] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_cond;
     result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_return_output := result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_return_output;

     -- n8_MUX[uxn_opcodes_h_l693_c7_37f4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l693_c7_37f4_cond <= VAR_n8_MUX_uxn_opcodes_h_l693_c7_37f4_cond;
     n8_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue;
     n8_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l693_c7_37f4_return_output := n8_MUX_uxn_opcodes_h_l693_c7_37f4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l697_c7_b46e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l697_c7_b46e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_return_output;

     -- t8_MUX[uxn_opcodes_h_l685_c2_7705] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l685_c2_7705_cond <= VAR_t8_MUX_uxn_opcodes_h_l685_c2_7705_cond;
     t8_MUX_uxn_opcodes_h_l685_c2_7705_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l685_c2_7705_iftrue;
     t8_MUX_uxn_opcodes_h_l685_c2_7705_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l685_c2_7705_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l685_c2_7705_return_output := t8_MUX_uxn_opcodes_h_l685_c2_7705_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l690_c7_0cd6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l697_c7_b46e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c7_37f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l693_c7_37f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_b46e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_b46e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_b46e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_37f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_4f03_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l685_c2_7705_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l690_c7_0cd6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output;

     -- n8_MUX[uxn_opcodes_h_l690_c7_0cd6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l690_c7_0cd6_cond <= VAR_n8_MUX_uxn_opcodes_h_l690_c7_0cd6_cond;
     n8_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue;
     n8_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output := n8_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l685_c2_7705] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l697_c7_b46e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_return_output := result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l693_c7_37f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l693_c7_37f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c7_37f4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l685_c2_7705_iffalse := VAR_n8_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_37f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_37f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_37f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_b46e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l690_c7_0cd6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l685_c2_7705] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l690_c7_0cd6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output;

     -- n8_MUX[uxn_opcodes_h_l685_c2_7705] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l685_c2_7705_cond <= VAR_n8_MUX_uxn_opcodes_h_l685_c2_7705_cond;
     n8_MUX_uxn_opcodes_h_l685_c2_7705_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l685_c2_7705_iftrue;
     n8_MUX_uxn_opcodes_h_l685_c2_7705_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l685_c2_7705_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l685_c2_7705_return_output := n8_MUX_uxn_opcodes_h_l685_c2_7705_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l693_c7_37f4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_return_output := result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l690_c7_0cd6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l685_c2_7705_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_37f4_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l685_c2_7705] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l685_c2_7705] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l690_c7_0cd6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output := result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l685_c2_7705] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_0cd6_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l685_c2_7705] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_cond;
     result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_return_output := result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fc62_uxn_opcodes_h_l713_l681_DUPLICATE_c854 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fc62_uxn_opcodes_h_l713_l681_DUPLICATE_c854_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fc62(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_7705_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_7705_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_7705_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_7705_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_7705_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_7705_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fc62_uxn_opcodes_h_l713_l681_DUPLICATE_c854_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fc62_uxn_opcodes_h_l713_l681_DUPLICATE_c854_return_output;
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
