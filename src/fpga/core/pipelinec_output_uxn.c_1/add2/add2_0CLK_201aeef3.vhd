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
-- Submodules: 123
entity add2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_201aeef3;
architecture arch of add2_0CLK_201aeef3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l933_c6_5989]
signal BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l933_c1_4997]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l933_c2_1d77]
signal n16_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l933_c2_1d77]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l933_c2_1d77]
signal result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l933_c2_1d77]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l933_c2_1d77]
signal result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l933_c2_1d77]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l933_c2_1d77]
signal result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l933_c2_1d77]
signal result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l933_c2_1d77]
signal t16_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l933_c2_1d77]
signal tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l934_c3_f7cf[uxn_opcodes_h_l934_c3_f7cf]
signal printf_uxn_opcodes_h_l934_c3_f7cf_uxn_opcodes_h_l934_c3_f7cf_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l939_c11_643c]
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l939_c7_d041]
signal n16_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l939_c7_d041]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l939_c7_d041]
signal result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c7_d041]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l939_c7_d041]
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c7_d041]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l939_c7_d041]
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l939_c7_d041]
signal result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l939_c7_d041]
signal t16_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l939_c7_d041]
signal tmp16_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l942_c11_911c]
signal BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l942_c7_a4d6]
signal n16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l942_c7_a4d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l942_c7_a4d6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l942_c7_a4d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l942_c7_a4d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l942_c7_a4d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l942_c7_a4d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l942_c7_a4d6]
signal result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l942_c7_a4d6]
signal t16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l942_c7_a4d6]
signal tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l947_c11_79bd]
signal BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l947_c7_b526]
signal n16_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l947_c7_b526]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l947_c7_b526]
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l947_c7_b526]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l947_c7_b526]
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l947_c7_b526]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l947_c7_b526]
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l947_c7_b526]
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l947_c7_b526]
signal t16_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l947_c7_b526]
signal tmp16_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l950_c11_0bee]
signal BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l950_c7_9d26]
signal n16_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l950_c7_9d26]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l950_c7_9d26]
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l950_c7_9d26]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l950_c7_9d26]
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l950_c7_9d26]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l950_c7_9d26]
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l950_c7_9d26]
signal result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l950_c7_9d26]
signal t16_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l950_c7_9d26]
signal tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l951_c3_14ba]
signal BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l954_c11_2bc3]
signal BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l954_c7_2cdd]
signal n16_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l954_c7_2cdd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l954_c7_2cdd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l954_c7_2cdd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l954_c7_2cdd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l954_c7_2cdd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l954_c7_2cdd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l954_c7_2cdd]
signal result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l954_c7_2cdd]
signal tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l957_c11_2764]
signal BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l957_c7_828a]
signal n16_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l957_c7_828a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l957_c7_828a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l957_c7_828a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l957_c7_828a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l957_c7_828a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l957_c7_828a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l957_c7_828a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l957_c7_828a]
signal result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l957_c7_828a]
signal tmp16_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l957_c7_828a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l962_c11_4de4]
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l962_c7_3f4b]
signal n16_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l962_c7_3f4b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l962_c7_3f4b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c7_3f4b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l962_c7_3f4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c7_3f4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l962_c7_3f4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l962_c7_3f4b]
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l962_c7_3f4b]
signal tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l965_c11_7750]
signal BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l965_c7_ae70]
signal n16_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l965_c7_ae70]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l965_c7_ae70]
signal result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l965_c7_ae70]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l965_c7_ae70]
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l965_c7_ae70]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l965_c7_ae70]
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l965_c7_ae70]
signal result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l965_c7_ae70]
signal tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l966_c3_4dc0]
signal BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l967_c11_fd80]
signal BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l970_c32_876b]
signal BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l970_c32_f8d9]
signal BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l970_c32_3161]
signal MUX_uxn_opcodes_h_l970_c32_3161_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l970_c32_3161_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l970_c32_3161_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l970_c32_3161_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l972_c11_81d2]
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l972_c7_d0ea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l972_c7_d0ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l972_c7_d0ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l972_c7_d0ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l972_c7_d0ea]
signal result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l978_c11_8e69]
signal BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l978_c7_e742]
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l978_c7_e742]
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l978_c7_e742]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l978_c7_e742]
signal result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l980_c34_626a]
signal CONST_SR_8_uxn_opcodes_h_l980_c34_626a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l980_c34_626a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l982_c11_6818]
signal BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l982_c7_88c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l982_c7_88c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
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
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989
BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_left,
BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_right,
BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_return_output);

-- n16_MUX_uxn_opcodes_h_l933_c2_1d77
n16_MUX_uxn_opcodes_h_l933_c2_1d77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l933_c2_1d77_cond,
n16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue,
n16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse,
n16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77
result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77
result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77
result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77
result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77
result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77
result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_cond,
result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_return_output);

-- t16_MUX_uxn_opcodes_h_l933_c2_1d77
t16_MUX_uxn_opcodes_h_l933_c2_1d77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l933_c2_1d77_cond,
t16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue,
t16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse,
t16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output);

-- tmp16_MUX_uxn_opcodes_h_l933_c2_1d77
tmp16_MUX_uxn_opcodes_h_l933_c2_1d77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_cond,
tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue,
tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse,
tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output);

-- printf_uxn_opcodes_h_l934_c3_f7cf_uxn_opcodes_h_l934_c3_f7cf
printf_uxn_opcodes_h_l934_c3_f7cf_uxn_opcodes_h_l934_c3_f7cf : entity work.printf_uxn_opcodes_h_l934_c3_f7cf_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l934_c3_f7cf_uxn_opcodes_h_l934_c3_f7cf_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c
BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_left,
BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_right,
BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_return_output);

-- n16_MUX_uxn_opcodes_h_l939_c7_d041
n16_MUX_uxn_opcodes_h_l939_c7_d041 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l939_c7_d041_cond,
n16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue,
n16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse,
n16_MUX_uxn_opcodes_h_l939_c7_d041_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041
result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041
result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_cond,
result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_return_output);

-- t16_MUX_uxn_opcodes_h_l939_c7_d041
t16_MUX_uxn_opcodes_h_l939_c7_d041 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l939_c7_d041_cond,
t16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue,
t16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse,
t16_MUX_uxn_opcodes_h_l939_c7_d041_return_output);

-- tmp16_MUX_uxn_opcodes_h_l939_c7_d041
tmp16_MUX_uxn_opcodes_h_l939_c7_d041 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l939_c7_d041_cond,
tmp16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue,
tmp16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse,
tmp16_MUX_uxn_opcodes_h_l939_c7_d041_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c
BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_left,
BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_right,
BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_return_output);

-- n16_MUX_uxn_opcodes_h_l942_c7_a4d6
n16_MUX_uxn_opcodes_h_l942_c7_a4d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond,
n16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue,
n16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse,
n16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6
result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6
result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6
result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6
result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6
result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_cond,
result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output);

-- t16_MUX_uxn_opcodes_h_l942_c7_a4d6
t16_MUX_uxn_opcodes_h_l942_c7_a4d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond,
t16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue,
t16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse,
t16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6
tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond,
tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue,
tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse,
tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd
BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_left,
BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_right,
BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_return_output);

-- n16_MUX_uxn_opcodes_h_l947_c7_b526
n16_MUX_uxn_opcodes_h_l947_c7_b526 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l947_c7_b526_cond,
n16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue,
n16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse,
n16_MUX_uxn_opcodes_h_l947_c7_b526_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526
result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_cond,
result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_return_output);

-- t16_MUX_uxn_opcodes_h_l947_c7_b526
t16_MUX_uxn_opcodes_h_l947_c7_b526 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l947_c7_b526_cond,
t16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue,
t16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse,
t16_MUX_uxn_opcodes_h_l947_c7_b526_return_output);

-- tmp16_MUX_uxn_opcodes_h_l947_c7_b526
tmp16_MUX_uxn_opcodes_h_l947_c7_b526 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l947_c7_b526_cond,
tmp16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue,
tmp16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse,
tmp16_MUX_uxn_opcodes_h_l947_c7_b526_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee
BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_left,
BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_right,
BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_return_output);

-- n16_MUX_uxn_opcodes_h_l950_c7_9d26
n16_MUX_uxn_opcodes_h_l950_c7_9d26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l950_c7_9d26_cond,
n16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue,
n16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse,
n16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26
result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26
result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_cond,
result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_return_output);

-- t16_MUX_uxn_opcodes_h_l950_c7_9d26
t16_MUX_uxn_opcodes_h_l950_c7_9d26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l950_c7_9d26_cond,
t16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue,
t16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse,
t16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output);

-- tmp16_MUX_uxn_opcodes_h_l950_c7_9d26
tmp16_MUX_uxn_opcodes_h_l950_c7_9d26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_cond,
tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue,
tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse,
tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba
BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_left,
BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_right,
BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3
BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_left,
BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_right,
BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_return_output);

-- n16_MUX_uxn_opcodes_h_l954_c7_2cdd
n16_MUX_uxn_opcodes_h_l954_c7_2cdd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l954_c7_2cdd_cond,
n16_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue,
n16_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse,
n16_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd
result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_cond,
result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd
tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_cond,
tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue,
tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse,
tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764
BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_left,
BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_right,
BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_return_output);

-- n16_MUX_uxn_opcodes_h_l957_c7_828a
n16_MUX_uxn_opcodes_h_l957_c7_828a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l957_c7_828a_cond,
n16_MUX_uxn_opcodes_h_l957_c7_828a_iftrue,
n16_MUX_uxn_opcodes_h_l957_c7_828a_iffalse,
n16_MUX_uxn_opcodes_h_l957_c7_828a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a
result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a
result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a
result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a
result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a
result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a
result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_cond,
result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l957_c7_828a
tmp16_MUX_uxn_opcodes_h_l957_c7_828a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l957_c7_828a_cond,
tmp16_MUX_uxn_opcodes_h_l957_c7_828a_iftrue,
tmp16_MUX_uxn_opcodes_h_l957_c7_828a_iffalse,
tmp16_MUX_uxn_opcodes_h_l957_c7_828a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4
BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_left,
BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_right,
BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_return_output);

-- n16_MUX_uxn_opcodes_h_l962_c7_3f4b
n16_MUX_uxn_opcodes_h_l962_c7_3f4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l962_c7_3f4b_cond,
n16_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue,
n16_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse,
n16_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b
result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_cond,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b
tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_cond,
tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue,
tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse,
tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750
BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_left,
BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_right,
BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_return_output);

-- n16_MUX_uxn_opcodes_h_l965_c7_ae70
n16_MUX_uxn_opcodes_h_l965_c7_ae70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l965_c7_ae70_cond,
n16_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue,
n16_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse,
n16_MUX_uxn_opcodes_h_l965_c7_ae70_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70
result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70
result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70
result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_cond,
result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_return_output);

-- tmp16_MUX_uxn_opcodes_h_l965_c7_ae70
tmp16_MUX_uxn_opcodes_h_l965_c7_ae70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_cond,
tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue,
tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse,
tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0
BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_left,
BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_right,
BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80
BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_left,
BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_right,
BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l970_c32_876b
BIN_OP_AND_uxn_opcodes_h_l970_c32_876b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_left,
BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_right,
BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9
BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_left,
BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_right,
BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_return_output);

-- MUX_uxn_opcodes_h_l970_c32_3161
MUX_uxn_opcodes_h_l970_c32_3161 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l970_c32_3161_cond,
MUX_uxn_opcodes_h_l970_c32_3161_iftrue,
MUX_uxn_opcodes_h_l970_c32_3161_iffalse,
MUX_uxn_opcodes_h_l970_c32_3161_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2
BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_left,
BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_right,
BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea
result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_cond,
result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69
BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_left,
BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_right,
BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742
result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_cond,
result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_return_output);

-- CONST_SR_8_uxn_opcodes_h_l980_c34_626a
CONST_SR_8_uxn_opcodes_h_l980_c34_626a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l980_c34_626a_x,
CONST_SR_8_uxn_opcodes_h_l980_c34_626a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818
BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_left,
BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_right,
BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf
CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_return_output,
 n16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_return_output,
 t16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output,
 tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_return_output,
 n16_MUX_uxn_opcodes_h_l939_c7_d041_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_return_output,
 t16_MUX_uxn_opcodes_h_l939_c7_d041_return_output,
 tmp16_MUX_uxn_opcodes_h_l939_c7_d041_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_return_output,
 n16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output,
 t16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output,
 tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_return_output,
 n16_MUX_uxn_opcodes_h_l947_c7_b526_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_return_output,
 t16_MUX_uxn_opcodes_h_l947_c7_b526_return_output,
 tmp16_MUX_uxn_opcodes_h_l947_c7_b526_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_return_output,
 n16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_return_output,
 t16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output,
 tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output,
 BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_return_output,
 n16_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output,
 tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_return_output,
 n16_MUX_uxn_opcodes_h_l957_c7_828a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_return_output,
 tmp16_MUX_uxn_opcodes_h_l957_c7_828a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_return_output,
 n16_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output,
 tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_return_output,
 n16_MUX_uxn_opcodes_h_l965_c7_ae70_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_return_output,
 tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_return_output,
 BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_return_output,
 BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_return_output,
 MUX_uxn_opcodes_h_l970_c32_3161_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_return_output,
 CONST_SR_8_uxn_opcodes_h_l980_c34_626a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l936_c3_6ba7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_d041_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l934_c3_f7cf_uxn_opcodes_h_l934_c3_f7cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l940_c3_0827 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_d041_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l945_c3_e32d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_b526_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l948_c3_c3db : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_b526_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l952_c3_e5ce : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l957_c7_828a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l955_c3_3795 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l957_c7_828a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_203b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l957_c7_828a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l957_c7_828a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l957_c7_828a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_8ace : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l967_c3_9cb5 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l970_c32_3161_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l970_c32_3161_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l970_c32_3161_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l970_c32_3161_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_334a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l976_c24_2d3f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_18ef : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l980_c34_626a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l980_c34_626a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l980_c24_b6b0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l972_l942_l939_DUPLICATE_2d41_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_e089_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l933_l957_l954_l982_l950_l978_l947_l942_l965_l939_DUPLICATE_b681_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l978_l947_l942_l965_l939_DUPLICATE_c68f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_4088_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l957_l954_l982_l950_l978_l947_l972_l942_l965_l939_DUPLICATE_c8db_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l951_l958_l943_l966_DUPLICATE_3480_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l978_l965_DUPLICATE_d7ca_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l929_l987_DUPLICATE_6e6f_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l936_c3_6ba7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l936_c3_6ba7;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l945_c3_e32d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l945_c3_e32d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l955_c3_3795 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l955_c3_3795;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l940_c3_0827 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l940_c3_0827;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l952_c3_e5ce := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l952_c3_e5ce;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_203b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_203b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_18ef := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_18ef;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_right := to_unsigned(6, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_8ace := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_8ace;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l970_c32_3161_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_right := to_unsigned(10, 4);
     VAR_MUX_uxn_opcodes_h_l970_c32_3161_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_334a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_334a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l948_c3_c3db := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l948_c3_c3db;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_right := to_unsigned(11, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l980_c34_626a_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l957_c7_828a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l980_c34_626a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l980_c34_626a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l980_c34_626a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l980_c34_626a_return_output := CONST_SR_8_uxn_opcodes_h_l980_c34_626a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l950_c11_0bee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_left;
     BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_return_output := BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l970_c32_876b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_left;
     BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_return_output := BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l965_c11_7750] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_left;
     BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_return_output := BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l957_c11_2764] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_left;
     BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_return_output := BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l972_c11_81d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l939_c11_643c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_left;
     BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_return_output := BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l933_l957_l954_l982_l950_l978_l947_l942_l965_l939_DUPLICATE_b681 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l933_l957_l954_l982_l950_l978_l947_l942_l965_l939_DUPLICATE_b681_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l954_c11_2bc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l972_l942_l939_DUPLICATE_2d41 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l972_l942_l939_DUPLICATE_2d41_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l933_c6_5989] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_left;
     BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_return_output := BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l947_c11_79bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_e089 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_e089_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l957_l954_l982_l950_l978_l947_l972_l942_l965_l939_DUPLICATE_c8db LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l957_l954_l982_l950_l978_l947_l972_l942_l965_l939_DUPLICATE_c8db_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l982_c11_6818] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_left;
     BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_return_output := BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l978_c11_8e69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_left;
     BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_return_output := BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l976_c24_2d3f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l976_c24_2d3f_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l951_l958_l943_l966_DUPLICATE_3480 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l951_l958_l943_l966_DUPLICATE_3480_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l978_l947_l942_l965_l939_DUPLICATE_c68f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l978_l947_l942_l965_l939_DUPLICATE_c68f_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l942_c11_911c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_left;
     BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_return_output := BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l978_l965_DUPLICATE_d7ca LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l978_l965_DUPLICATE_d7ca_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_4088 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_4088_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l962_c11_4de4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_left;
     BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_return_output := BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_left := VAR_BIN_OP_AND_uxn_opcodes_h_l970_c32_876b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l933_c2_1d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l933_c2_1d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c6_5989_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l939_c7_d041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c7_d041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_d041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_643c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_911c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l947_c7_b526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l947_c7_b526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_b526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_79bd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l950_c7_9d26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l950_c7_9d26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_0bee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l954_c7_2cdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_2bc3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l957_c7_828a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l957_c7_828a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_2764_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_3f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_4de4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_ae70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_7750_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_81d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_8e69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_6818_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l951_l958_l943_l966_DUPLICATE_3480_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l951_l958_l943_l966_DUPLICATE_3480_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l951_l958_l943_l966_DUPLICATE_3480_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l976_c24_2d3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_e089_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_e089_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_e089_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_e089_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_e089_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_e089_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_e089_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_e089_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_e089_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l957_l954_l982_l950_l978_l947_l972_l942_l965_l939_DUPLICATE_c8db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l957_l954_l982_l950_l978_l947_l972_l942_l965_l939_DUPLICATE_c8db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l957_l954_l982_l950_l978_l947_l972_l942_l965_l939_DUPLICATE_c8db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l957_l954_l982_l950_l978_l947_l972_l942_l965_l939_DUPLICATE_c8db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l957_l954_l982_l950_l978_l947_l972_l942_l965_l939_DUPLICATE_c8db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l957_l954_l982_l950_l978_l947_l972_l942_l965_l939_DUPLICATE_c8db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l957_l954_l982_l950_l978_l947_l972_l942_l965_l939_DUPLICATE_c8db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l957_l954_l982_l950_l978_l947_l972_l942_l965_l939_DUPLICATE_c8db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l957_l954_l982_l950_l978_l947_l972_l942_l965_l939_DUPLICATE_c8db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l957_l954_l982_l950_l978_l947_l972_l942_l965_l939_DUPLICATE_c8db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l957_l954_l982_l950_l978_l947_l972_l942_l965_l939_DUPLICATE_c8db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l972_l942_l939_DUPLICATE_2d41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l972_l942_l939_DUPLICATE_2d41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l972_l942_l939_DUPLICATE_2d41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l972_l942_l939_DUPLICATE_2d41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l972_l942_l939_DUPLICATE_2d41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l972_l942_l939_DUPLICATE_2d41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l972_l942_l939_DUPLICATE_2d41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l972_l942_l939_DUPLICATE_2d41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l947_l972_l942_l939_DUPLICATE_2d41_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_4088_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_4088_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_4088_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_4088_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_4088_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_4088_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_4088_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l957_l954_l950_l947_l942_l965_l939_DUPLICATE_4088_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l933_l957_l954_l982_l950_l978_l947_l942_l965_l939_DUPLICATE_b681_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l933_l957_l954_l982_l950_l978_l947_l942_l965_l939_DUPLICATE_b681_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l933_l957_l954_l982_l950_l978_l947_l942_l965_l939_DUPLICATE_b681_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l933_l957_l954_l982_l950_l978_l947_l942_l965_l939_DUPLICATE_b681_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l933_l957_l954_l982_l950_l978_l947_l942_l965_l939_DUPLICATE_b681_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l933_l957_l954_l982_l950_l978_l947_l942_l965_l939_DUPLICATE_b681_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l933_l957_l954_l982_l950_l978_l947_l942_l965_l939_DUPLICATE_b681_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l933_l957_l954_l982_l950_l978_l947_l942_l965_l939_DUPLICATE_b681_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l933_l957_l954_l982_l950_l978_l947_l942_l965_l939_DUPLICATE_b681_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l933_l957_l954_l982_l950_l978_l947_l942_l965_l939_DUPLICATE_b681_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l933_l957_l954_l982_l950_l978_l947_l942_l965_l939_DUPLICATE_b681_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l978_l965_DUPLICATE_d7ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l978_l965_DUPLICATE_d7ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l978_l947_l942_l965_l939_DUPLICATE_c68f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l978_l947_l942_l965_l939_DUPLICATE_c68f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l978_l947_l942_l965_l939_DUPLICATE_c68f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l978_l947_l942_l965_l939_DUPLICATE_c68f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l978_l947_l942_l965_l939_DUPLICATE_c68f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l978_l947_l942_l965_l939_DUPLICATE_c68f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l978_l947_l942_l965_l939_DUPLICATE_c68f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l978_l947_l942_l965_l939_DUPLICATE_c68f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l978_l947_l942_l965_l939_DUPLICATE_c68f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l933_l957_l954_l950_l978_l947_l942_l965_l939_DUPLICATE_c68f_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l951_c3_14ba] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_left;
     BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_return_output := BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l933_c1_4997] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l965_c7_ae70] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l966_c3_4dc0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_left;
     BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_return_output := BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l972_c7_d0ea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l980_c24_b6b0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l980_c24_b6b0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l980_c34_626a_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l970_c32_f8d9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_left;
     BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_return_output := BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l982_c7_88c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l982_c7_88c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l978_c7_e742] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l970_c32_3161_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l970_c32_f8d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l951_c3_14ba_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_right := VAR_BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l966_c3_4dc0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l980_c24_b6b0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l957_c7_828a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l944_l959_DUPLICATE_85bf_return_output;
     VAR_printf_uxn_opcodes_h_l934_c3_f7cf_uxn_opcodes_h_l934_c3_f7cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l933_c1_4997_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_88c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_88c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_e742_return_output;
     -- n16_MUX[uxn_opcodes_h_l965_c7_ae70] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l965_c7_ae70_cond <= VAR_n16_MUX_uxn_opcodes_h_l965_c7_ae70_cond;
     n16_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue;
     n16_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_ae70_return_output := n16_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l962_c7_3f4b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;

     -- MUX[uxn_opcodes_h_l970_c32_3161] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l970_c32_3161_cond <= VAR_MUX_uxn_opcodes_h_l970_c32_3161_cond;
     MUX_uxn_opcodes_h_l970_c32_3161_iftrue <= VAR_MUX_uxn_opcodes_h_l970_c32_3161_iftrue;
     MUX_uxn_opcodes_h_l970_c32_3161_iffalse <= VAR_MUX_uxn_opcodes_h_l970_c32_3161_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l970_c32_3161_return_output := MUX_uxn_opcodes_h_l970_c32_3161_return_output;

     -- printf_uxn_opcodes_h_l934_c3_f7cf[uxn_opcodes_h_l934_c3_f7cf] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l934_c3_f7cf_uxn_opcodes_h_l934_c3_f7cf_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l934_c3_f7cf_uxn_opcodes_h_l934_c3_f7cf_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l965_c7_ae70] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;

     -- t16_MUX[uxn_opcodes_h_l950_c7_9d26] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l950_c7_9d26_cond <= VAR_t16_MUX_uxn_opcodes_h_l950_c7_9d26_cond;
     t16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue;
     t16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output := t16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l978_c7_e742] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l972_c7_d0ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l978_c7_e742] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_cond;
     result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_return_output := result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l978_c7_e742] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l967_c11_fd80] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_left;
     BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_return_output := BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l967_c3_9cb5 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l967_c11_fd80_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue := VAR_MUX_uxn_opcodes_h_l970_c32_3161_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_e742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_e742_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_e742_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse := VAR_t16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue := VAR_tmp16_uxn_opcodes_h_l967_c3_9cb5;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l972_c7_d0ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l972_c7_d0ea] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_cond;
     result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output := result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output;

     -- t16_MUX[uxn_opcodes_h_l947_c7_b526] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l947_c7_b526_cond <= VAR_t16_MUX_uxn_opcodes_h_l947_c7_b526_cond;
     t16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue;
     t16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l947_c7_b526_return_output := t16_MUX_uxn_opcodes_h_l947_c7_b526_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l972_c7_d0ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l965_c7_ae70] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_cond;
     tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue;
     tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_return_output := tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;

     -- n16_MUX[uxn_opcodes_h_l962_c7_3f4b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l962_c7_3f4b_cond <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_3f4b_cond;
     n16_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue;
     n16_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output := n16_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l957_c7_828a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l965_c7_ae70] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l965_c7_ae70] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l962_c7_3f4b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l957_c7_828a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l957_c7_828a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_d0ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l947_c7_b526_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;
     -- n16_MUX[uxn_opcodes_h_l957_c7_828a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l957_c7_828a_cond <= VAR_n16_MUX_uxn_opcodes_h_l957_c7_828a_cond;
     n16_MUX_uxn_opcodes_h_l957_c7_828a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l957_c7_828a_iftrue;
     n16_MUX_uxn_opcodes_h_l957_c7_828a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l957_c7_828a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l957_c7_828a_return_output := n16_MUX_uxn_opcodes_h_l957_c7_828a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l954_c7_2cdd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c7_3f4b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l965_c7_ae70] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_cond;
     result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_return_output := result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l965_c7_ae70] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c7_3f4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l965_c7_ae70] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;

     -- t16_MUX[uxn_opcodes_h_l942_c7_a4d6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond <= VAR_t16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond;
     t16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue;
     t16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output := t16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l957_c7_828a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l962_c7_3f4b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_cond;
     tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output := tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l957_c7_828a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l957_c7_828a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l965_c7_ae70_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse := VAR_t16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l957_c7_828a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l957_c7_828a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l950_c7_9d26] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;

     -- t16_MUX[uxn_opcodes_h_l939_c7_d041] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l939_c7_d041_cond <= VAR_t16_MUX_uxn_opcodes_h_l939_c7_d041_cond;
     t16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue;
     t16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l939_c7_d041_return_output := t16_MUX_uxn_opcodes_h_l939_c7_d041_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l962_c7_3f4b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output := result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l957_c7_828a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l957_c7_828a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l957_c7_828a_cond;
     tmp16_MUX_uxn_opcodes_h_l957_c7_828a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l957_c7_828a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l957_c7_828a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l957_c7_828a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l957_c7_828a_return_output := tmp16_MUX_uxn_opcodes_h_l957_c7_828a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l962_c7_3f4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l954_c7_2cdd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l962_c7_3f4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;

     -- n16_MUX[uxn_opcodes_h_l954_c7_2cdd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l954_c7_2cdd_cond <= VAR_n16_MUX_uxn_opcodes_h_l954_c7_2cdd_cond;
     n16_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue;
     n16_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output := n16_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l957_c7_828a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse := VAR_n16_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_828a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_828a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_3f4b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse := VAR_t16_MUX_uxn_opcodes_h_l939_c7_d041_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l957_c7_828a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l957_c7_828a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l954_c7_2cdd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;

     -- t16_MUX[uxn_opcodes_h_l933_c2_1d77] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l933_c2_1d77_cond <= VAR_t16_MUX_uxn_opcodes_h_l933_c2_1d77_cond;
     t16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue;
     t16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output := t16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l957_c7_828a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_return_output := result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_return_output;

     -- n16_MUX[uxn_opcodes_h_l950_c7_9d26] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l950_c7_9d26_cond <= VAR_n16_MUX_uxn_opcodes_h_l950_c7_9d26_cond;
     n16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue;
     n16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output := n16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l950_c7_9d26] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l947_c7_b526] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l954_c7_2cdd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l957_c7_828a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l954_c7_2cdd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_cond;
     tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output := tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse := VAR_n16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_828a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_b526_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_828a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l957_c7_828a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l950_c7_9d26] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_cond;
     tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue;
     tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output := tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l954_c7_2cdd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l950_c7_9d26] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l950_c7_9d26] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l954_c7_2cdd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output := result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l954_c7_2cdd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l942_c7_a4d6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l947_c7_b526] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_return_output;

     -- n16_MUX[uxn_opcodes_h_l947_c7_b526] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l947_c7_b526_cond <= VAR_n16_MUX_uxn_opcodes_h_l947_c7_b526_cond;
     n16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue;
     n16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l947_c7_b526_return_output := n16_MUX_uxn_opcodes_h_l947_c7_b526_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l947_c7_b526_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_b526_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_2cdd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l947_c7_b526] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l947_c7_b526_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_b526_cond;
     tmp16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_b526_iftrue;
     tmp16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_b526_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_b526_return_output := tmp16_MUX_uxn_opcodes_h_l947_c7_b526_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l950_c7_9d26] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;

     -- n16_MUX[uxn_opcodes_h_l942_c7_a4d6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond <= VAR_n16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond;
     n16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue;
     n16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output := n16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l947_c7_b526] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l950_c7_9d26] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l950_c7_9d26] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_cond;
     result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_return_output := result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l942_c7_a4d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l939_c7_d041] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l947_c7_b526] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse := VAR_n16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_d041_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_b526_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_b526_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_9d26_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_b526_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l933_c2_1d77] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l947_c7_b526] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_cond;
     result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_return_output := result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l942_c7_a4d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l939_c7_d041] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l942_c7_a4d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l947_c7_b526] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l942_c7_a4d6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_cond;
     tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output := tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;

     -- n16_MUX[uxn_opcodes_h_l939_c7_d041] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l939_c7_d041_cond <= VAR_n16_MUX_uxn_opcodes_h_l939_c7_d041_cond;
     n16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue;
     n16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l939_c7_d041_return_output := n16_MUX_uxn_opcodes_h_l939_c7_d041_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l947_c7_b526] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse := VAR_n16_MUX_uxn_opcodes_h_l939_c7_d041_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_b526_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_d041_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_b526_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_b526_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l942_c7_a4d6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output := result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;

     -- n16_MUX[uxn_opcodes_h_l933_c2_1d77] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l933_c2_1d77_cond <= VAR_n16_MUX_uxn_opcodes_h_l933_c2_1d77_cond;
     n16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue;
     n16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output := n16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c7_d041] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l933_c2_1d77] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l942_c7_a4d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l942_c7_a4d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l939_c7_d041] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l939_c7_d041_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_d041_cond;
     tmp16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_d041_iftrue;
     tmp16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_d041_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_d041_return_output := tmp16_MUX_uxn_opcodes_h_l939_c7_d041_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c7_d041] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_d041_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_d041_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_a4d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_d041_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l933_c2_1d77] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_cond;
     tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue;
     tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output := tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l939_c7_d041] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_cond;
     result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_return_output := result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l939_c7_d041] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l933_c2_1d77] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l933_c2_1d77] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l939_c7_d041] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_d041_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_d041_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_d041_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l933_c2_1d77_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l933_c2_1d77] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l933_c2_1d77] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l933_c2_1d77] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_cond;
     result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_return_output := result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l929_l987_DUPLICATE_6e6f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l929_l987_DUPLICATE_6e6f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c2_1d77_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l933_c2_1d77_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l933_c2_1d77_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c2_1d77_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c2_1d77_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c2_1d77_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l933_c2_1d77_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l929_l987_DUPLICATE_6e6f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l929_l987_DUPLICATE_6e6f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
