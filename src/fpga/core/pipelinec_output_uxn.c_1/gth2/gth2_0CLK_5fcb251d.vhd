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
-- BIN_OP_EQ[uxn_opcodes_h_l1139_c6_a48f]
signal BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1139_c1_f986]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1139_c2_af92]
signal n16_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1139_c2_af92]
signal t16_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1139_c2_af92]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1139_c2_af92]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1139_c2_af92]
signal result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1139_c2_af92]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1139_c2_af92]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1139_c2_af92]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1139_c2_af92]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1139_c2_af92]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1140_c3_af1a[uxn_opcodes_h_l1140_c3_af1a]
signal printf_uxn_opcodes_h_l1140_c3_af1a_uxn_opcodes_h_l1140_c3_af1a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1147_c11_c565]
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1147_c7_5c84]
signal n16_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1147_c7_5c84]
signal t16_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1147_c7_5c84]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1147_c7_5c84]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1147_c7_5c84]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1147_c7_5c84]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1147_c7_5c84]
signal result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1147_c7_5c84]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1147_c7_5c84]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1151_c11_da6a]
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1151_c7_236f]
signal n16_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1151_c7_236f]
signal t16_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1151_c7_236f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1151_c7_236f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1151_c7_236f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1151_c7_236f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1151_c7_236f]
signal result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1151_c7_236f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1151_c7_236f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1157_c11_03e9]
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1157_c7_11ba]
signal n16_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1157_c7_11ba]
signal t16_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1157_c7_11ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1157_c7_11ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1157_c7_11ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1157_c7_11ba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1157_c7_11ba]
signal result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1157_c7_11ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1157_c7_11ba]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1161_c11_f22d]
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1161_c7_3fd8]
signal n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1161_c7_3fd8]
signal t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1161_c7_3fd8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1161_c7_3fd8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1161_c7_3fd8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1161_c7_3fd8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1161_c7_3fd8]
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1161_c7_3fd8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1161_c7_3fd8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1162_c3_a3da]
signal BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1166_c11_ff68]
signal BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1166_c7_6891]
signal n16_MUX_uxn_opcodes_h_l1166_c7_6891_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1166_c7_6891_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1166_c7_6891]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1166_c7_6891]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1166_c7_6891]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1166_c7_6891]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1166_c7_6891]
signal result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1166_c7_6891]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1166_c7_6891]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1170_c11_28a9]
signal BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1170_c7_e281]
signal n16_MUX_uxn_opcodes_h_l1170_c7_e281_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1170_c7_e281_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1170_c7_e281]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1170_c7_e281]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1170_c7_e281]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1170_c7_e281]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1170_c7_e281]
signal result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1170_c7_e281]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1170_c7_e281]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1176_c11_787a]
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1176_c7_30c4]
signal n16_MUX_uxn_opcodes_h_l1176_c7_30c4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1176_c7_30c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1176_c7_30c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1176_c7_30c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1176_c7_30c4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1176_c7_30c4]
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1176_c7_30c4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1176_c7_30c4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1180_c11_b830]
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1180_c7_09b6]
signal n16_MUX_uxn_opcodes_h_l1180_c7_09b6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1180_c7_09b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1180_c7_09b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1180_c7_09b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1180_c7_09b6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1180_c7_09b6]
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1180_c7_09b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1180_c7_09b6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1181_c3_7525]
signal BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1184_c32_36e6]
signal BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1184_c32_6c7c]
signal BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1184_c32_8251]
signal MUX_uxn_opcodes_h_l1184_c32_8251_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1184_c32_8251_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1184_c32_8251_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1184_c32_8251_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1186_c11_a633]
signal BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1186_c7_8b9b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1186_c7_8b9b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1186_c7_8b9b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1186_c7_8b9b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1186_c7_8b9b]
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1190_c24_a5db]
signal BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1190_c24_4271]
signal MUX_uxn_opcodes_h_l1190_c24_4271_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1190_c24_4271_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1190_c24_4271_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1190_c24_4271_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1192_c11_a973]
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1192_c7_853e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1192_c7_853e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_49dd( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_read := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_sp_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f
BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_left,
BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_right,
BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_return_output);

-- n16_MUX_uxn_opcodes_h_l1139_c2_af92
n16_MUX_uxn_opcodes_h_l1139_c2_af92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1139_c2_af92_cond,
n16_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue,
n16_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse,
n16_MUX_uxn_opcodes_h_l1139_c2_af92_return_output);

-- t16_MUX_uxn_opcodes_h_l1139_c2_af92
t16_MUX_uxn_opcodes_h_l1139_c2_af92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1139_c2_af92_cond,
t16_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue,
t16_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse,
t16_MUX_uxn_opcodes_h_l1139_c2_af92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92
result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_cond,
result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_return_output);

-- printf_uxn_opcodes_h_l1140_c3_af1a_uxn_opcodes_h_l1140_c3_af1a
printf_uxn_opcodes_h_l1140_c3_af1a_uxn_opcodes_h_l1140_c3_af1a : entity work.printf_uxn_opcodes_h_l1140_c3_af1a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1140_c3_af1a_uxn_opcodes_h_l1140_c3_af1a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_left,
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_right,
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_return_output);

-- n16_MUX_uxn_opcodes_h_l1147_c7_5c84
n16_MUX_uxn_opcodes_h_l1147_c7_5c84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1147_c7_5c84_cond,
n16_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue,
n16_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse,
n16_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output);

-- t16_MUX_uxn_opcodes_h_l1147_c7_5c84
t16_MUX_uxn_opcodes_h_l1147_c7_5c84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1147_c7_5c84_cond,
t16_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue,
t16_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse,
t16_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84
result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_cond,
result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_left,
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_right,
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_return_output);

-- n16_MUX_uxn_opcodes_h_l1151_c7_236f
n16_MUX_uxn_opcodes_h_l1151_c7_236f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1151_c7_236f_cond,
n16_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue,
n16_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse,
n16_MUX_uxn_opcodes_h_l1151_c7_236f_return_output);

-- t16_MUX_uxn_opcodes_h_l1151_c7_236f
t16_MUX_uxn_opcodes_h_l1151_c7_236f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1151_c7_236f_cond,
t16_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue,
t16_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse,
t16_MUX_uxn_opcodes_h_l1151_c7_236f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f
result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f
result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_left,
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_right,
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_return_output);

-- n16_MUX_uxn_opcodes_h_l1157_c7_11ba
n16_MUX_uxn_opcodes_h_l1157_c7_11ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1157_c7_11ba_cond,
n16_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue,
n16_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse,
n16_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output);

-- t16_MUX_uxn_opcodes_h_l1157_c7_11ba
t16_MUX_uxn_opcodes_h_l1157_c7_11ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1157_c7_11ba_cond,
t16_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue,
t16_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse,
t16_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_cond,
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba
result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_left,
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_right,
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_return_output);

-- n16_MUX_uxn_opcodes_h_l1161_c7_3fd8
n16_MUX_uxn_opcodes_h_l1161_c7_3fd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond,
n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue,
n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse,
n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output);

-- t16_MUX_uxn_opcodes_h_l1161_c7_3fd8
t16_MUX_uxn_opcodes_h_l1161_c7_3fd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond,
t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue,
t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse,
t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da
BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_left,
BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_right,
BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68
BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_left,
BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_right,
BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_return_output);

-- n16_MUX_uxn_opcodes_h_l1166_c7_6891
n16_MUX_uxn_opcodes_h_l1166_c7_6891 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1166_c7_6891_cond,
n16_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue,
n16_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse,
n16_MUX_uxn_opcodes_h_l1166_c7_6891_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891
result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891
result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891
result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_cond,
result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891
result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9
BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_left,
BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_right,
BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_return_output);

-- n16_MUX_uxn_opcodes_h_l1170_c7_e281
n16_MUX_uxn_opcodes_h_l1170_c7_e281 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1170_c7_e281_cond,
n16_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue,
n16_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse,
n16_MUX_uxn_opcodes_h_l1170_c7_e281_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_cond,
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281
result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281
result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_left,
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_right,
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_return_output);

-- n16_MUX_uxn_opcodes_h_l1176_c7_30c4
n16_MUX_uxn_opcodes_h_l1176_c7_30c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1176_c7_30c4_cond,
n16_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue,
n16_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse,
n16_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_left,
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_right,
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_return_output);

-- n16_MUX_uxn_opcodes_h_l1180_c7_09b6
n16_MUX_uxn_opcodes_h_l1180_c7_09b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1180_c7_09b6_cond,
n16_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue,
n16_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse,
n16_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525
BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_left,
BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_right,
BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6
BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_left,
BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_right,
BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c
BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_left,
BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_right,
BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_return_output);

-- MUX_uxn_opcodes_h_l1184_c32_8251
MUX_uxn_opcodes_h_l1184_c32_8251 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1184_c32_8251_cond,
MUX_uxn_opcodes_h_l1184_c32_8251_iftrue,
MUX_uxn_opcodes_h_l1184_c32_8251_iffalse,
MUX_uxn_opcodes_h_l1184_c32_8251_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_left,
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_right,
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db
BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_left,
BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_right,
BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_return_output);

-- MUX_uxn_opcodes_h_l1190_c24_4271
MUX_uxn_opcodes_h_l1190_c24_4271 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1190_c24_4271_cond,
MUX_uxn_opcodes_h_l1190_c24_4271_iftrue,
MUX_uxn_opcodes_h_l1190_c24_4271_iffalse,
MUX_uxn_opcodes_h_l1190_c24_4271_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_left,
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_right,
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd
CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_return_output,
 n16_MUX_uxn_opcodes_h_l1139_c2_af92_return_output,
 t16_MUX_uxn_opcodes_h_l1139_c2_af92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_return_output,
 n16_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output,
 t16_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_return_output,
 n16_MUX_uxn_opcodes_h_l1151_c7_236f_return_output,
 t16_MUX_uxn_opcodes_h_l1151_c7_236f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_return_output,
 n16_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output,
 t16_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_return_output,
 n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output,
 t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_return_output,
 n16_MUX_uxn_opcodes_h_l1166_c7_6891_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_return_output,
 n16_MUX_uxn_opcodes_h_l1170_c7_e281_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_return_output,
 n16_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_return_output,
 n16_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_return_output,
 MUX_uxn_opcodes_h_l1184_c32_8251_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_return_output,
 MUX_uxn_opcodes_h_l1190_c24_4271_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1143_c3_f5a3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1140_c3_af1a_uxn_opcodes_h_l1140_c3_af1a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1149_c3_e0b2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1155_c3_3594 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1159_c3_7411 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1166_c7_6891_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1164_c3_7afb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1170_c7_e281_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1166_c7_6891_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_b901 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1170_c7_e281_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_7055 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1176_c7_30c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_eb51 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_09b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1180_c7_09b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1184_c32_8251_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1184_c32_8251_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1184_c32_8251_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1184_c32_8251_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1189_c3_4023 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1190_c24_4271_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1190_c24_4271_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1190_c24_4271_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1190_c24_4271_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_7d39_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_8525_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_63ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_b9c0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_7f04_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_1fcf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1186_l1180_DUPLICATE_9ceb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1135_l1197_DUPLICATE_4707_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1189_c3_4023 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1189_c3_4023;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1159_c3_7411 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1159_c3_7411;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_b901 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_b901;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_eb51 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_eb51;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1149_c3_e0b2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1149_c3_e0b2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_7055 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_7055;
     VAR_MUX_uxn_opcodes_h_l1184_c32_8251_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1143_c3_f5a3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1143_c3_f5a3;
     VAR_MUX_uxn_opcodes_h_l1184_c32_8251_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1190_c24_4271_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1155_c3_3594 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1155_c3_3594;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1164_c3_7afb := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1164_c3_7afb;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1190_c24_4271_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_right := to_unsigned(10, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse := t16;
     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1180_c7_09b6] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1180_c7_09b6_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_7f04 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_7f04_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1170_c11_28a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_1fcf LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_1fcf_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1186_c11_a633] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_left;
     BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_return_output := BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1166_c11_ff68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_left;
     BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_return_output := BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1186_l1180_DUPLICATE_9ceb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1186_l1180_DUPLICATE_9ceb_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1176_c11_787a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1139_c2_af92] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1139_c2_af92_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_8525 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_8525_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1192_c11_a973] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_left;
     BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_return_output := BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_7d39 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_7d39_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_63ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_63ff_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1157_c11_03e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1151_c11_da6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_b9c0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_b9c0_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1139_c6_a48f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1190_c24_a5db] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_left;
     BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_return_output := BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1161_c11_f22d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1184_c32_36e6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_left;
     BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_return_output := BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1180_c11_b830] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_left;
     BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_return_output := BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1147_c11_c565] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_left;
     BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_return_output := BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_36e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1139_c2_af92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1139_c2_af92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_a48f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_5c84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_5c84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_c565_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_236f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_236f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_da6a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_11ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1157_c7_11ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_03e9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_f22d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1166_c7_6891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_ff68_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1170_c7_e281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_28a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1176_c7_30c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_787a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_09b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_b830_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_a633_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a973_return_output;
     VAR_MUX_uxn_opcodes_h_l1190_c24_4271_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_a5db_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_1fcf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_1fcf_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_1fcf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_8525_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_8525_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_8525_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_8525_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_8525_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_8525_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_8525_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_8525_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_8525_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_b9c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_b9c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_b9c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_b9c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_b9c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_b9c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_b9c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_b9c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_b9c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_b9c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_63ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_63ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_63ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_63ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_63ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_63ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_63ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_63ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_63ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_7f04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_7f04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_7f04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_7f04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_7f04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_7f04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_7f04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_7f04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_7f04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1186_l1180_DUPLICATE_9ceb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1186_l1180_DUPLICATE_9ceb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_7d39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_7d39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_7d39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_7d39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_7d39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_7d39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_7d39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_7d39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_7d39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_7d39_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1139_c2_af92_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1180_c7_09b6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1139_c1_f986] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1186_c7_8b9b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1180_c7_09b6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1139_c2_af92] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1181_c3_7525] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_left;
     BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_return_output := BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1184_c32_6c7c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_left;
     BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_return_output := BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1186_c7_8b9b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output;

     -- MUX[uxn_opcodes_h_l1190_c24_4271] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1190_c24_4271_cond <= VAR_MUX_uxn_opcodes_h_l1190_c24_4271_cond;
     MUX_uxn_opcodes_h_l1190_c24_4271_iftrue <= VAR_MUX_uxn_opcodes_h_l1190_c24_4271_iftrue;
     MUX_uxn_opcodes_h_l1190_c24_4271_iffalse <= VAR_MUX_uxn_opcodes_h_l1190_c24_4271_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1190_c24_4271_return_output := MUX_uxn_opcodes_h_l1190_c24_4271_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1192_c7_853e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1162_c3_a3da] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_left;
     BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_return_output := BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1192_c7_853e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1184_c32_8251_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6c7c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_a3da_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_7525_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1172_l1153_DUPLICATE_24cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue := VAR_MUX_uxn_opcodes_h_l1190_c24_4271_return_output;
     VAR_printf_uxn_opcodes_h_l1140_c3_af1a_uxn_opcodes_h_l1140_c3_af1a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_f986_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_853e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_853e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output;
     -- n16_MUX[uxn_opcodes_h_l1180_c7_09b6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1180_c7_09b6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1180_c7_09b6_cond;
     n16_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue;
     n16_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output := n16_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1186_c7_8b9b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1186_c7_8b9b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1186_c7_8b9b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1176_c7_30c4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1161_c7_3fd8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond;
     t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue;
     t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output := t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;

     -- MUX[uxn_opcodes_h_l1184_c32_8251] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1184_c32_8251_cond <= VAR_MUX_uxn_opcodes_h_l1184_c32_8251_cond;
     MUX_uxn_opcodes_h_l1184_c32_8251_iftrue <= VAR_MUX_uxn_opcodes_h_l1184_c32_8251_iftrue;
     MUX_uxn_opcodes_h_l1184_c32_8251_iffalse <= VAR_MUX_uxn_opcodes_h_l1184_c32_8251_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1184_c32_8251_return_output := MUX_uxn_opcodes_h_l1184_c32_8251_return_output;

     -- printf_uxn_opcodes_h_l1140_c3_af1a[uxn_opcodes_h_l1140_c3_af1a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1140_c3_af1a_uxn_opcodes_h_l1140_c3_af1a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1140_c3_af1a_uxn_opcodes_h_l1140_c3_af1a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1180_c7_09b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1180_c7_09b6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue := VAR_MUX_uxn_opcodes_h_l1184_c32_8251_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_8b9b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1176_c7_30c4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1180_c7_09b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1180_c7_09b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1157_c7_11ba] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1157_c7_11ba_cond <= VAR_t16_MUX_uxn_opcodes_h_l1157_c7_11ba_cond;
     t16_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue;
     t16_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output := t16_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1176_c7_30c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1180_c7_09b6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1170_c7_e281] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_return_output;

     -- n16_MUX[uxn_opcodes_h_l1176_c7_30c4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1176_c7_30c4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1176_c7_30c4_cond;
     n16_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue;
     n16_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output := n16_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1180_c7_09b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_e281_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_09b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1176_c7_30c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1170_c7_e281] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1170_c7_e281] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1176_c7_30c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1170_c7_e281] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1170_c7_e281_cond <= VAR_n16_MUX_uxn_opcodes_h_l1170_c7_e281_cond;
     n16_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue;
     n16_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1170_c7_e281_return_output := n16_MUX_uxn_opcodes_h_l1170_c7_e281_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1176_c7_30c4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1151_c7_236f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1151_c7_236f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_236f_cond;
     t16_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue;
     t16_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_236f_return_output := t16_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1176_c7_30c4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1166_c7_6891] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1170_c7_e281_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_e281_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_6891_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_e281_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_30c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1170_c7_e281] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_return_output := result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1170_c7_e281] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1161_c7_3fd8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1147_c7_5c84] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1147_c7_5c84_cond <= VAR_t16_MUX_uxn_opcodes_h_l1147_c7_5c84_cond;
     t16_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue;
     t16_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output := t16_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;

     -- n16_MUX[uxn_opcodes_h_l1166_c7_6891] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1166_c7_6891_cond <= VAR_n16_MUX_uxn_opcodes_h_l1166_c7_6891_cond;
     n16_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue;
     n16_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1166_c7_6891_return_output := n16_MUX_uxn_opcodes_h_l1166_c7_6891_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1170_c7_e281] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1170_c7_e281] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1166_c7_6891] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1166_c7_6891] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1166_c7_6891_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_e281_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_6891_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_e281_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_e281_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_6891_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_e281_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;
     -- n16_MUX[uxn_opcodes_h_l1161_c7_3fd8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond;
     n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue;
     n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output := n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1161_c7_3fd8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1166_c7_6891] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_return_output;

     -- t16_MUX[uxn_opcodes_h_l1139_c2_af92] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1139_c2_af92_cond <= VAR_t16_MUX_uxn_opcodes_h_l1139_c2_af92_cond;
     t16_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue;
     t16_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1139_c2_af92_return_output := t16_MUX_uxn_opcodes_h_l1139_c2_af92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1166_c7_6891] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1161_c7_3fd8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1166_c7_6891] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_return_output := result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1166_c7_6891] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1157_c7_11ba] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_6891_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_6891_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_6891_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_6891_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1139_c2_af92_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1161_c7_3fd8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1161_c7_3fd8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1157_c7_11ba] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1157_c7_11ba_cond <= VAR_n16_MUX_uxn_opcodes_h_l1157_c7_11ba_cond;
     n16_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue;
     n16_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output := n16_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1157_c7_11ba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1161_c7_3fd8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1161_c7_3fd8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1151_c7_236f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1157_c7_11ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_3fd8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1151_c7_236f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1157_c7_11ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1157_c7_11ba] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output := result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1157_c7_11ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1157_c7_11ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;

     -- n16_MUX[uxn_opcodes_h_l1151_c7_236f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1151_c7_236f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_236f_cond;
     n16_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue;
     n16_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_236f_return_output := n16_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1147_c7_5c84] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1151_c7_236f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_11ba_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1151_c7_236f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1147_c7_5c84] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1147_c7_5c84_cond <= VAR_n16_MUX_uxn_opcodes_h_l1147_c7_5c84_cond;
     n16_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue;
     n16_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output := n16_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1151_c7_236f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1151_c7_236f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1147_c7_5c84] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1139_c2_af92] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1147_c7_5c84] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1151_c7_236f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_236f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1147_c7_5c84] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1147_c7_5c84] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output := result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;

     -- n16_MUX[uxn_opcodes_h_l1139_c2_af92] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1139_c2_af92_cond <= VAR_n16_MUX_uxn_opcodes_h_l1139_c2_af92_cond;
     n16_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue;
     n16_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1139_c2_af92_return_output := n16_MUX_uxn_opcodes_h_l1139_c2_af92_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1139_c2_af92] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1147_c7_5c84] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1147_c7_5c84] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1139_c2_af92] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1139_c2_af92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_5c84_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1139_c2_af92] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1139_c2_af92] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1139_c2_af92] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_return_output := result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1139_c2_af92] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1135_l1197_DUPLICATE_4707 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1135_l1197_DUPLICATE_4707_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_af92_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_af92_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_af92_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_af92_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_af92_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_af92_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_af92_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_af92_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1135_l1197_DUPLICATE_4707_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1135_l1197_DUPLICATE_4707_return_output;
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
