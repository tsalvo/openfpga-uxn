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
-- Submodules: 108
entity gth2_0CLK_5fcb251d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_5fcb251d;
architecture arch of gth2_0CLK_5fcb251d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1139_c6_cc1b]
signal BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1139_c1_c77b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1139_c2_57af]
signal n16_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1139_c2_57af]
signal t16_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1139_c2_57af]
signal result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1139_c2_57af]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1139_c2_57af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1139_c2_57af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1139_c2_57af]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1139_c2_57af]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1139_c2_57af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1139_c2_57af]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1140_c3_a148[uxn_opcodes_h_l1140_c3_a148]
signal printf_uxn_opcodes_h_l1140_c3_a148_uxn_opcodes_h_l1140_c3_a148_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1147_c11_5faa]
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1147_c7_1a55]
signal n16_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1147_c7_1a55]
signal t16_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1147_c7_1a55]
signal result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1147_c7_1a55]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1147_c7_1a55]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1147_c7_1a55]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1147_c7_1a55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1147_c7_1a55]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1147_c7_1a55]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1151_c11_d22a]
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1151_c7_54c4]
signal n16_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1151_c7_54c4]
signal t16_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1151_c7_54c4]
signal result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1151_c7_54c4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1151_c7_54c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1151_c7_54c4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1151_c7_54c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1151_c7_54c4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1151_c7_54c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1157_c11_bd50]
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1157_c7_8bfa]
signal n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1157_c7_8bfa]
signal t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1157_c7_8bfa]
signal result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1157_c7_8bfa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1157_c7_8bfa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1157_c7_8bfa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1157_c7_8bfa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1157_c7_8bfa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1157_c7_8bfa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1161_c11_c298]
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1161_c7_f23d]
signal n16_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1161_c7_f23d]
signal t16_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1161_c7_f23d]
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1161_c7_f23d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1161_c7_f23d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1161_c7_f23d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1161_c7_f23d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1161_c7_f23d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1161_c7_f23d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1162_c3_f5d9]
signal BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1166_c11_b556]
signal BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1166_c7_f1be]
signal n16_MUX_uxn_opcodes_h_l1166_c7_f1be_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1166_c7_f1be]
signal result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1166_c7_f1be]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1166_c7_f1be]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1166_c7_f1be]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1166_c7_f1be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1166_c7_f1be]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1166_c7_f1be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1170_c11_7b93]
signal BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1170_c7_6dee]
signal n16_MUX_uxn_opcodes_h_l1170_c7_6dee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1170_c7_6dee]
signal result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1170_c7_6dee]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1170_c7_6dee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1170_c7_6dee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1170_c7_6dee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1170_c7_6dee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1170_c7_6dee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1176_c11_d759]
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1176_c7_ecbc]
signal n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1176_c7_ecbc]
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1176_c7_ecbc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1176_c7_ecbc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1176_c7_ecbc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1176_c7_ecbc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1176_c7_ecbc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1176_c7_ecbc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1180_c11_cbce]
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1180_c7_a79b]
signal n16_MUX_uxn_opcodes_h_l1180_c7_a79b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1180_c7_a79b]
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1180_c7_a79b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1180_c7_a79b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1180_c7_a79b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1180_c7_a79b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1180_c7_a79b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1180_c7_a79b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1181_c3_97d4]
signal BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1184_c32_978c]
signal BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1184_c32_6b28]
signal BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1184_c32_1394]
signal MUX_uxn_opcodes_h_l1184_c32_1394_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1184_c32_1394_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1184_c32_1394_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1184_c32_1394_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1186_c11_f16b]
signal BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1186_c7_ac61]
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1186_c7_ac61]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1186_c7_ac61]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1186_c7_ac61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1186_c7_ac61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1190_c24_b941]
signal BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1190_c24_944c]
signal MUX_uxn_opcodes_h_l1190_c24_944c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1190_c24_944c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1190_c24_944c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1190_c24_944c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1192_c11_9f19]
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1192_c7_7069]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1192_c7_7069]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_81ab( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b
BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_left,
BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_right,
BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_return_output);

-- n16_MUX_uxn_opcodes_h_l1139_c2_57af
n16_MUX_uxn_opcodes_h_l1139_c2_57af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1139_c2_57af_cond,
n16_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue,
n16_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse,
n16_MUX_uxn_opcodes_h_l1139_c2_57af_return_output);

-- t16_MUX_uxn_opcodes_h_l1139_c2_57af
t16_MUX_uxn_opcodes_h_l1139_c2_57af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1139_c2_57af_cond,
t16_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue,
t16_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse,
t16_MUX_uxn_opcodes_h_l1139_c2_57af_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af
result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_cond,
result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_return_output);

-- printf_uxn_opcodes_h_l1140_c3_a148_uxn_opcodes_h_l1140_c3_a148
printf_uxn_opcodes_h_l1140_c3_a148_uxn_opcodes_h_l1140_c3_a148 : entity work.printf_uxn_opcodes_h_l1140_c3_a148_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1140_c3_a148_uxn_opcodes_h_l1140_c3_a148_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_left,
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_right,
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_return_output);

-- n16_MUX_uxn_opcodes_h_l1147_c7_1a55
n16_MUX_uxn_opcodes_h_l1147_c7_1a55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1147_c7_1a55_cond,
n16_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue,
n16_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse,
n16_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output);

-- t16_MUX_uxn_opcodes_h_l1147_c7_1a55
t16_MUX_uxn_opcodes_h_l1147_c7_1a55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1147_c7_1a55_cond,
t16_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue,
t16_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse,
t16_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55
result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_cond,
result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_left,
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_right,
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_return_output);

-- n16_MUX_uxn_opcodes_h_l1151_c7_54c4
n16_MUX_uxn_opcodes_h_l1151_c7_54c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1151_c7_54c4_cond,
n16_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue,
n16_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse,
n16_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output);

-- t16_MUX_uxn_opcodes_h_l1151_c7_54c4
t16_MUX_uxn_opcodes_h_l1151_c7_54c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1151_c7_54c4_cond,
t16_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue,
t16_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse,
t16_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4
result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4
result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_left,
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_right,
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_return_output);

-- n16_MUX_uxn_opcodes_h_l1157_c7_8bfa
n16_MUX_uxn_opcodes_h_l1157_c7_8bfa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond,
n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue,
n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse,
n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output);

-- t16_MUX_uxn_opcodes_h_l1157_c7_8bfa
t16_MUX_uxn_opcodes_h_l1157_c7_8bfa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond,
t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue,
t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse,
t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond,
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa
result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_left,
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_right,
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_return_output);

-- n16_MUX_uxn_opcodes_h_l1161_c7_f23d
n16_MUX_uxn_opcodes_h_l1161_c7_f23d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1161_c7_f23d_cond,
n16_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue,
n16_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse,
n16_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output);

-- t16_MUX_uxn_opcodes_h_l1161_c7_f23d
t16_MUX_uxn_opcodes_h_l1161_c7_f23d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1161_c7_f23d_cond,
t16_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue,
t16_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse,
t16_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9
BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_left,
BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_right,
BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556
BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_left,
BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_right,
BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_return_output);

-- n16_MUX_uxn_opcodes_h_l1166_c7_f1be
n16_MUX_uxn_opcodes_h_l1166_c7_f1be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1166_c7_f1be_cond,
n16_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue,
n16_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse,
n16_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be
result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_cond,
result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be
result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be
result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be
result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93
BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_left,
BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_right,
BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_return_output);

-- n16_MUX_uxn_opcodes_h_l1170_c7_6dee
n16_MUX_uxn_opcodes_h_l1170_c7_6dee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1170_c7_6dee_cond,
n16_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue,
n16_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse,
n16_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_cond,
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee
result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee
result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_left,
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_right,
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_return_output);

-- n16_MUX_uxn_opcodes_h_l1176_c7_ecbc
n16_MUX_uxn_opcodes_h_l1176_c7_ecbc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond,
n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue,
n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse,
n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_left,
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_right,
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_return_output);

-- n16_MUX_uxn_opcodes_h_l1180_c7_a79b
n16_MUX_uxn_opcodes_h_l1180_c7_a79b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1180_c7_a79b_cond,
n16_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue,
n16_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse,
n16_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4
BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_left,
BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_right,
BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c
BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_left,
BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_right,
BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28
BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_left,
BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_right,
BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_return_output);

-- MUX_uxn_opcodes_h_l1184_c32_1394
MUX_uxn_opcodes_h_l1184_c32_1394 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1184_c32_1394_cond,
MUX_uxn_opcodes_h_l1184_c32_1394_iftrue,
MUX_uxn_opcodes_h_l1184_c32_1394_iffalse,
MUX_uxn_opcodes_h_l1184_c32_1394_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_left,
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_right,
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_cond,
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941
BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_left,
BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_right,
BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_return_output);

-- MUX_uxn_opcodes_h_l1190_c24_944c
MUX_uxn_opcodes_h_l1190_c24_944c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1190_c24_944c_cond,
MUX_uxn_opcodes_h_l1190_c24_944c_iftrue,
MUX_uxn_opcodes_h_l1190_c24_944c_iffalse,
MUX_uxn_opcodes_h_l1190_c24_944c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_left,
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_right,
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a
CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_return_output,
 n16_MUX_uxn_opcodes_h_l1139_c2_57af_return_output,
 t16_MUX_uxn_opcodes_h_l1139_c2_57af_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_return_output,
 n16_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output,
 t16_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_return_output,
 n16_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output,
 t16_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_return_output,
 n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output,
 t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_return_output,
 n16_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output,
 t16_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_return_output,
 n16_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_return_output,
 n16_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_return_output,
 n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_return_output,
 n16_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_return_output,
 MUX_uxn_opcodes_h_l1184_c32_1394_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_return_output,
 MUX_uxn_opcodes_h_l1190_c24_944c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1143_c3_7174 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1140_c3_a148_uxn_opcodes_h_l1140_c3_a148_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1149_c3_178b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1155_c3_1b47 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1159_c3_f59a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1164_c3_f694 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1166_c7_f1be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_8b27 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1170_c7_6dee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_6d21 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_c562 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_a79b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1180_c7_a79b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1184_c32_1394_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1184_c32_1394_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1184_c32_1394_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1184_c32_1394_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1189_c3_38f2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1190_c24_944c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1190_c24_944c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1190_c24_944c_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1190_c24_944c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_0185_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1151_l1186_l1157_l1170_DUPLICATE_5bd0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_2d1c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_10f7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_6887_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_b3f3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1186_l1180_DUPLICATE_392b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1197_l1135_DUPLICATE_42ab_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1190_c24_944c_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_opcodes_h_l1184_c32_1394_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_right := to_unsigned(10, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1149_c3_178b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1149_c3_178b;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1155_c3_1b47 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1155_c3_1b47;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_8b27 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_8b27;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l1184_c32_1394_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1164_c3_f694 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1164_c3_f694;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1159_c3_f59a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1159_c3_f59a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1189_c3_38f2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1189_c3_38f2;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1190_c24_944c_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_6d21 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_6d21;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1143_c3_7174 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1143_c3_7174;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_c562 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_c562;

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1176_c11_d759] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_left;
     BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_return_output := BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1157_c11_bd50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_left;
     BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_return_output := BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_6887 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_6887_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_2d1c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_2d1c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1186_l1180_DUPLICATE_392b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1186_l1180_DUPLICATE_392b_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_b3f3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_b3f3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1139_c6_cc1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1180_c11_cbce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1186_c11_f16b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1151_l1186_l1157_l1170_DUPLICATE_5bd0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1151_l1186_l1157_l1170_DUPLICATE_5bd0_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1161_c11_c298] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_left;
     BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_return_output := BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_10f7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_10f7_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1139_c2_57af] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1139_c2_57af_return_output := result.is_stack_index_flipped;

     -- BIN_OP_GT[uxn_opcodes_h_l1190_c24_b941] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_left;
     BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_return_output := BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1180_c7_a79b] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1180_c7_a79b_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1147_c11_5faa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_0185 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_0185_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1170_c11_7b93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_left;
     BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_return_output := BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1184_c32_978c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_left;
     BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_return_output := BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1192_c11_9f19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_left;
     BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_return_output := BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1166_c11_b556] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_left;
     BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_return_output := BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1151_c11_d22a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_978c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1139_c2_57af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1139_c2_57af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_cc1b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_1a55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_1a55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_5faa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_54c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_54c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_d22a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_bd50_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_f23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1161_c7_f23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_c298_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1166_c7_f1be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_b556_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1170_c7_6dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_7b93_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_d759_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_a79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cbce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_f16b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_9f19_return_output;
     VAR_MUX_uxn_opcodes_h_l1190_c24_944c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_b941_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_b3f3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_b3f3_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_b3f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_2d1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_2d1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_2d1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_2d1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_2d1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_2d1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_2d1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_2d1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_2d1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_6887_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_6887_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_6887_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_6887_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_6887_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_6887_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_6887_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_6887_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_6887_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_6887_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1151_l1186_l1157_l1170_DUPLICATE_5bd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1151_l1186_l1157_l1170_DUPLICATE_5bd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1151_l1186_l1157_l1170_DUPLICATE_5bd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1151_l1186_l1157_l1170_DUPLICATE_5bd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1151_l1186_l1157_l1170_DUPLICATE_5bd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1151_l1186_l1157_l1170_DUPLICATE_5bd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1151_l1186_l1157_l1170_DUPLICATE_5bd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1151_l1186_l1157_l1170_DUPLICATE_5bd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1151_l1186_l1157_l1170_DUPLICATE_5bd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_10f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_10f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_10f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_10f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_10f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_10f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_10f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_10f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1192_l1166_l1176_l1161_l1147_l1180_l1151_l1157_l1170_DUPLICATE_10f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1186_l1180_DUPLICATE_392b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1186_l1180_DUPLICATE_392b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_0185_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_0185_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_0185_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_0185_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_0185_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_0185_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_0185_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_0185_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_0185_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1166_l1176_l1161_l1147_l1180_l1151_l1186_l1157_l1170_DUPLICATE_0185_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1139_c2_57af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1180_c7_a79b_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1184_c32_6b28] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_left;
     BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_return_output := BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a_return_output;

     -- MUX[uxn_opcodes_h_l1190_c24_944c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1190_c24_944c_cond <= VAR_MUX_uxn_opcodes_h_l1190_c24_944c_cond;
     MUX_uxn_opcodes_h_l1190_c24_944c_iftrue <= VAR_MUX_uxn_opcodes_h_l1190_c24_944c_iftrue;
     MUX_uxn_opcodes_h_l1190_c24_944c_iffalse <= VAR_MUX_uxn_opcodes_h_l1190_c24_944c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1190_c24_944c_return_output := MUX_uxn_opcodes_h_l1190_c24_944c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1180_c7_a79b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1139_c1_c77b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1162_c3_f5d9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_left;
     BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_return_output := BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1186_c7_ac61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1186_c7_ac61] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1192_c7_7069] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1181_c3_97d4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_left;
     BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_return_output := BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1192_c7_7069] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1139_c2_57af] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1184_c32_1394_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6b28_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_f5d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_97d4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_511a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue := VAR_MUX_uxn_opcodes_h_l1190_c24_944c_return_output;
     VAR_printf_uxn_opcodes_h_l1140_c3_a148_uxn_opcodes_h_l1140_c3_a148_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_c77b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_7069_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_7069_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1180_c7_a79b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output;

     -- MUX[uxn_opcodes_h_l1184_c32_1394] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1184_c32_1394_cond <= VAR_MUX_uxn_opcodes_h_l1184_c32_1394_cond;
     MUX_uxn_opcodes_h_l1184_c32_1394_iftrue <= VAR_MUX_uxn_opcodes_h_l1184_c32_1394_iftrue;
     MUX_uxn_opcodes_h_l1184_c32_1394_iffalse <= VAR_MUX_uxn_opcodes_h_l1184_c32_1394_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1184_c32_1394_return_output := MUX_uxn_opcodes_h_l1184_c32_1394_return_output;

     -- n16_MUX[uxn_opcodes_h_l1180_c7_a79b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1180_c7_a79b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1180_c7_a79b_cond;
     n16_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue;
     n16_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output := n16_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1186_c7_ac61] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output := result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1186_c7_ac61] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1176_c7_ecbc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1186_c7_ac61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output;

     -- t16_MUX[uxn_opcodes_h_l1161_c7_f23d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1161_c7_f23d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1161_c7_f23d_cond;
     t16_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue;
     t16_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output := t16_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1180_c7_a79b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output;

     -- printf_uxn_opcodes_h_l1140_c3_a148[uxn_opcodes_h_l1140_c3_a148] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1140_c3_a148_uxn_opcodes_h_l1140_c3_a148_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1140_c3_a148_uxn_opcodes_h_l1140_c3_a148_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue := VAR_MUX_uxn_opcodes_h_l1184_c32_1394_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_ac61_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1180_c7_a79b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1176_c7_ecbc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond;
     n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue;
     n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output := n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1176_c7_ecbc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1176_c7_ecbc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1180_c7_a79b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1180_c7_a79b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1157_c7_8bfa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond <= VAR_t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond;
     t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue;
     t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output := t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1180_c7_a79b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1170_c7_6dee] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_a79b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1170_c7_6dee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output;

     -- t16_MUX[uxn_opcodes_h_l1151_c7_54c4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1151_c7_54c4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_54c4_cond;
     t16_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue;
     t16_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output := t16_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1176_c7_ecbc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1176_c7_ecbc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1176_c7_ecbc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1176_c7_ecbc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1166_c7_f1be] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output;

     -- n16_MUX[uxn_opcodes_h_l1170_c7_6dee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1170_c7_6dee_cond <= VAR_n16_MUX_uxn_opcodes_h_l1170_c7_6dee_cond;
     n16_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue;
     n16_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output := n16_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1170_c7_6dee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_ecbc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;
     -- t16_MUX[uxn_opcodes_h_l1147_c7_1a55] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1147_c7_1a55_cond <= VAR_t16_MUX_uxn_opcodes_h_l1147_c7_1a55_cond;
     t16_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue;
     t16_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output := t16_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1170_c7_6dee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1166_c7_f1be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1170_c7_6dee] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output := result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output;

     -- n16_MUX[uxn_opcodes_h_l1166_c7_f1be] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1166_c7_f1be_cond <= VAR_n16_MUX_uxn_opcodes_h_l1166_c7_f1be_cond;
     n16_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue;
     n16_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output := n16_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1170_c7_6dee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1161_c7_f23d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1170_c7_6dee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1166_c7_f1be] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_6dee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;
     -- t16_MUX[uxn_opcodes_h_l1139_c2_57af] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1139_c2_57af_cond <= VAR_t16_MUX_uxn_opcodes_h_l1139_c2_57af_cond;
     t16_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue;
     t16_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1139_c2_57af_return_output := t16_MUX_uxn_opcodes_h_l1139_c2_57af_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1166_c7_f1be] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output := result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1166_c7_f1be] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1161_c7_f23d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1161_c7_f23d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1166_c7_f1be] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1157_c7_8bfa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;

     -- n16_MUX[uxn_opcodes_h_l1161_c7_f23d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1161_c7_f23d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1161_c7_f23d_cond;
     n16_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue;
     n16_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output := n16_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1166_c7_f1be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_f1be_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1139_c2_57af_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1161_c7_f23d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1157_c7_8bfa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;

     -- n16_MUX[uxn_opcodes_h_l1157_c7_8bfa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond <= VAR_n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond;
     n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue;
     n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output := n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1157_c7_8bfa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1161_c7_f23d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1161_c7_f23d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1161_c7_f23d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1151_c7_54c4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_f23d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1151_c7_54c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1157_c7_8bfa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1151_c7_54c4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1147_c7_1a55] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;

     -- n16_MUX[uxn_opcodes_h_l1151_c7_54c4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1151_c7_54c4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_54c4_cond;
     n16_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue;
     n16_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output := n16_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1157_c7_8bfa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1157_c7_8bfa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1157_c7_8bfa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output := result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_8bfa_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1147_c7_1a55] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1151_c7_54c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1147_c7_1a55] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1151_c7_54c4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1151_c7_54c4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1139_c2_57af] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_return_output;

     -- n16_MUX[uxn_opcodes_h_l1147_c7_1a55] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1147_c7_1a55_cond <= VAR_n16_MUX_uxn_opcodes_h_l1147_c7_1a55_cond;
     n16_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue;
     n16_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output := n16_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1151_c7_54c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_54c4_return_output;
     -- n16_MUX[uxn_opcodes_h_l1139_c2_57af] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1139_c2_57af_cond <= VAR_n16_MUX_uxn_opcodes_h_l1139_c2_57af_cond;
     n16_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue;
     n16_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1139_c2_57af_return_output := n16_MUX_uxn_opcodes_h_l1139_c2_57af_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1147_c7_1a55] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output := result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1139_c2_57af] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1147_c7_1a55] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1147_c7_1a55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1139_c2_57af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1147_c7_1a55] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1139_c2_57af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_1a55_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1139_c2_57af] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1139_c2_57af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1139_c2_57af] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_return_output := result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1139_c2_57af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1197_l1135_DUPLICATE_42ab LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1197_l1135_DUPLICATE_42ab_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_81ab(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_57af_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_57af_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_57af_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_57af_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_57af_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_57af_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_57af_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_57af_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1197_l1135_DUPLICATE_42ab_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1197_l1135_DUPLICATE_42ab_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
