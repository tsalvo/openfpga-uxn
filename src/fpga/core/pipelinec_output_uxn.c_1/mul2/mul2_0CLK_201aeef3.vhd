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
entity mul2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_201aeef3;
architecture arch of mul2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1283_c6_cf22]
signal BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1283_c1_5622]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1283_c2_894a]
signal tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1283_c2_894a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1283_c2_894a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1283_c2_894a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1283_c2_894a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1283_c2_894a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1283_c2_894a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1283_c2_894a]
signal result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1283_c2_894a]
signal t16_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1283_c2_894a]
signal n16_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1284_c3_fbc5[uxn_opcodes_h_l1284_c3_fbc5]
signal printf_uxn_opcodes_h_l1284_c3_fbc5_uxn_opcodes_h_l1284_c3_fbc5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1289_c11_3874]
signal BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1289_c7_f10b]
signal tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1289_c7_f10b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1289_c7_f10b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1289_c7_f10b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1289_c7_f10b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1289_c7_f10b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1289_c7_f10b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1289_c7_f10b]
signal result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1289_c7_f10b]
signal t16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1289_c7_f10b]
signal n16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1292_c11_7bf9]
signal BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1292_c7_a039]
signal tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1292_c7_a039]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1292_c7_a039]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1292_c7_a039]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1292_c7_a039]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1292_c7_a039]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1292_c7_a039]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1292_c7_a039]
signal result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1292_c7_a039]
signal t16_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1292_c7_a039]
signal n16_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1297_c11_ee1b]
signal BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1297_c7_d3c1]
signal tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1297_c7_d3c1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1297_c7_d3c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1297_c7_d3c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1297_c7_d3c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1297_c7_d3c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1297_c7_d3c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1297_c7_d3c1]
signal result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1297_c7_d3c1]
signal t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1297_c7_d3c1]
signal n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1300_c11_a146]
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1300_c7_0e19]
signal tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1300_c7_0e19]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1300_c7_0e19]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1300_c7_0e19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1300_c7_0e19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1300_c7_0e19]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1300_c7_0e19]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1300_c7_0e19]
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1300_c7_0e19]
signal t16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1300_c7_0e19]
signal n16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1301_c3_698f]
signal BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1304_c11_911b]
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1304_c7_83b6]
signal tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1304_c7_83b6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1304_c7_83b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1304_c7_83b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1304_c7_83b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1304_c7_83b6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1304_c7_83b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1304_c7_83b6]
signal result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1304_c7_83b6]
signal n16_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_45f1]
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1307_c7_2b64]
signal tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1307_c7_2b64]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_2b64]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_2b64]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_2b64]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1307_c7_2b64]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_2b64]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1307_c7_2b64]
signal result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1307_c7_2b64]
signal n16_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1312_c11_3007]
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1312_c7_d4d6]
signal tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1312_c7_d4d6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1312_c7_d4d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1312_c7_d4d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1312_c7_d4d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1312_c7_d4d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1312_c7_d4d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1312_c7_d4d6]
signal result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1312_c7_d4d6]
signal n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1315_c11_a8a8]
signal BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1315_c7_0c39]
signal tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1315_c7_0c39]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1315_c7_0c39]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1315_c7_0c39]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1315_c7_0c39]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1315_c7_0c39]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1315_c7_0c39]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1315_c7_0c39]
signal result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1315_c7_0c39]
signal n16_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1316_c3_34b8]
signal BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1317_c11_efe5]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1320_c32_6165]
signal BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1320_c32_9680]
signal BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1320_c32_3954]
signal MUX_uxn_opcodes_h_l1320_c32_3954_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1320_c32_3954_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1320_c32_3954_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1320_c32_3954_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1322_c11_faeb]
signal BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1322_c7_e629]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1322_c7_e629]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1322_c7_e629]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1322_c7_e629]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1322_c7_e629]
signal result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1328_c11_5097]
signal BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1328_c7_227f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1328_c7_227f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1328_c7_227f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1328_c7_227f]
signal result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1330_c34_6933]
signal CONST_SR_8_uxn_opcodes_h_l1330_c34_6933_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1330_c34_6933_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1332_c11_3209]
signal BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1332_c7_b4aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1332_c7_b4aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22
BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_left,
BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_right,
BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1283_c2_894a
tmp16_MUX_uxn_opcodes_h_l1283_c2_894a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_cond,
tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a
result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a
result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a
result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_return_output);

-- t16_MUX_uxn_opcodes_h_l1283_c2_894a
t16_MUX_uxn_opcodes_h_l1283_c2_894a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1283_c2_894a_cond,
t16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue,
t16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse,
t16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output);

-- n16_MUX_uxn_opcodes_h_l1283_c2_894a
n16_MUX_uxn_opcodes_h_l1283_c2_894a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1283_c2_894a_cond,
n16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue,
n16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse,
n16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output);

-- printf_uxn_opcodes_h_l1284_c3_fbc5_uxn_opcodes_h_l1284_c3_fbc5
printf_uxn_opcodes_h_l1284_c3_fbc5_uxn_opcodes_h_l1284_c3_fbc5 : entity work.printf_uxn_opcodes_h_l1284_c3_fbc5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1284_c3_fbc5_uxn_opcodes_h_l1284_c3_fbc5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874
BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_left,
BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_right,
BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b
tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond,
tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b
result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b
result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b
result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b
result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b
result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output);

-- t16_MUX_uxn_opcodes_h_l1289_c7_f10b
t16_MUX_uxn_opcodes_h_l1289_c7_f10b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond,
t16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue,
t16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse,
t16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output);

-- n16_MUX_uxn_opcodes_h_l1289_c7_f10b
n16_MUX_uxn_opcodes_h_l1289_c7_f10b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond,
n16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue,
n16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse,
n16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9
BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_left,
BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_right,
BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1292_c7_a039
tmp16_MUX_uxn_opcodes_h_l1292_c7_a039 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_cond,
tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue,
tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse,
tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039
result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039
result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039
result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039
result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039
result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039
result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_cond,
result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_return_output);

-- t16_MUX_uxn_opcodes_h_l1292_c7_a039
t16_MUX_uxn_opcodes_h_l1292_c7_a039 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1292_c7_a039_cond,
t16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue,
t16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse,
t16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output);

-- n16_MUX_uxn_opcodes_h_l1292_c7_a039
n16_MUX_uxn_opcodes_h_l1292_c7_a039 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1292_c7_a039_cond,
n16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue,
n16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse,
n16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b
BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_left,
BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_right,
BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1
tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond,
tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1
result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1
result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output);

-- t16_MUX_uxn_opcodes_h_l1297_c7_d3c1
t16_MUX_uxn_opcodes_h_l1297_c7_d3c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond,
t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue,
t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse,
t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output);

-- n16_MUX_uxn_opcodes_h_l1297_c7_d3c1
n16_MUX_uxn_opcodes_h_l1297_c7_d3c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond,
n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue,
n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse,
n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_left,
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_right,
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19
tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond,
tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue,
tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse,
tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_cond,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output);

-- t16_MUX_uxn_opcodes_h_l1300_c7_0e19
t16_MUX_uxn_opcodes_h_l1300_c7_0e19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond,
t16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue,
t16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse,
t16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output);

-- n16_MUX_uxn_opcodes_h_l1300_c7_0e19
n16_MUX_uxn_opcodes_h_l1300_c7_0e19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond,
n16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue,
n16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse,
n16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f
BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_left,
BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_right,
BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_left,
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_right,
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6
tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_cond,
tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6
result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6
result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output);

-- n16_MUX_uxn_opcodes_h_l1304_c7_83b6
n16_MUX_uxn_opcodes_h_l1304_c7_83b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1304_c7_83b6_cond,
n16_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue,
n16_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse,
n16_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_left,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_right,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64
tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_cond,
tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue,
tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse,
tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64
result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_cond,
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output);

-- n16_MUX_uxn_opcodes_h_l1307_c7_2b64
n16_MUX_uxn_opcodes_h_l1307_c7_2b64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1307_c7_2b64_cond,
n16_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue,
n16_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse,
n16_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007
BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_left,
BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_right,
BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6
tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond,
tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6
result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6
result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6
result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6
result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6
result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output);

-- n16_MUX_uxn_opcodes_h_l1312_c7_d4d6
n16_MUX_uxn_opcodes_h_l1312_c7_d4d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond,
n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue,
n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse,
n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_left,
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_right,
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39
tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_cond,
tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue,
tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse,
tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39
result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39
result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39
result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_cond,
result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output);

-- n16_MUX_uxn_opcodes_h_l1315_c7_0c39
n16_MUX_uxn_opcodes_h_l1315_c7_0c39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1315_c7_0c39_cond,
n16_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue,
n16_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse,
n16_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8
BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_left,
BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_right,
BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165
BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_left,
BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_right,
BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680
BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_left,
BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_right,
BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_return_output);

-- MUX_uxn_opcodes_h_l1320_c32_3954
MUX_uxn_opcodes_h_l1320_c32_3954 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1320_c32_3954_cond,
MUX_uxn_opcodes_h_l1320_c32_3954_iftrue,
MUX_uxn_opcodes_h_l1320_c32_3954_iffalse,
MUX_uxn_opcodes_h_l1320_c32_3954_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb
BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_left,
BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_right,
BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_cond,
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_left,
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_right,
BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f
result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1330_c34_6933
CONST_SR_8_uxn_opcodes_h_l1330_c34_6933 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1330_c34_6933_x,
CONST_SR_8_uxn_opcodes_h_l1330_c34_6933_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209
BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_left,
BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_right,
BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa
result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa
result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c
CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_return_output,
 tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_return_output,
 t16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output,
 n16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_return_output,
 tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output,
 t16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output,
 n16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_return_output,
 t16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output,
 n16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output,
 t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output,
 n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_return_output,
 tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output,
 t16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output,
 n16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output,
 n16_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output,
 n16_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_return_output,
 tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output,
 n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output,
 n16_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_return_output,
 MUX_uxn_opcodes_h_l1320_c32_3954_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_return_output,
 CONST_SR_8_uxn_opcodes_h_l1330_c34_6933_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1286_c3_c853 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1283_c2_894a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1284_c3_fbc5_uxn_opcodes_h_l1284_c3_fbc5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1290_c3_fcc3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1295_c3_62a6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1292_c7_a039_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_a035 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1302_c3_7ae9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_77c3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1304_c7_83b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1310_c3_6428 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2b64_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1313_c3_2c45 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1317_c3_e0f5 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1315_c7_0c39_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1320_c32_3954_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1320_c32_3954_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1320_c32_3954_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1320_c32_3954_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1325_c3_b554 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1326_c24_f2e6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1329_c3_aaa0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1330_c34_6933_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1330_c34_6933_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1330_c24_c770_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1315_l1307_DUPLICATE_b67d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1332_l1315_l1307_DUPLICATE_93e3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1322_l1307_DUPLICATE_9be5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1315_l1307_DUPLICATE_f462_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1315_l1307_DUPLICATE_47b2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1332_l1322_l1315_l1307_DUPLICATE_8026_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1301_l1293_l1308_l1316_DUPLICATE_9452_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1328_l1315_DUPLICATE_3332_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1337_l1279_DUPLICATE_9a6d_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1320_c32_3954_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1329_c3_aaa0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1329_c3_aaa0;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1320_c32_3954_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1286_c3_c853 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1286_c3_c853;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_a035 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_a035;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1310_c3_6428 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1310_c3_6428;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1295_c3_62a6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1295_c3_62a6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_right := to_unsigned(10, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1290_c3_fcc3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1290_c3_fcc3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_77c3 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_77c3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1313_c3_2c45 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1313_c3_2c45;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1302_c3_7ae9 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1302_c3_7ae9;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1325_c3_b554 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1325_c3_b554;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1330_c34_6933_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1315_l1307_DUPLICATE_47b2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1315_l1307_DUPLICATE_47b2_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1322_c11_faeb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1315_l1307_DUPLICATE_b67d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1315_l1307_DUPLICATE_b67d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1312_c11_3007] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_left;
     BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_return_output := BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1326_c24_f2e6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1326_c24_f2e6_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1332_l1315_l1307_DUPLICATE_93e3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1332_l1315_l1307_DUPLICATE_93e3_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1283_c6_cf22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_left;
     BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_return_output := BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_45f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1289_c11_3874] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_left;
     BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_return_output := BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1315_l1307_DUPLICATE_f462 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1315_l1307_DUPLICATE_f462_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1304_c11_911b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1300_c11_a146] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_left;
     BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_return_output := BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1315_c11_a8a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1297_c11_ee1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1320_c32_6165] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_left;
     BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_return_output := BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1332_c11_3209] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_left;
     BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_return_output := BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1328_c11_5097] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_left;
     BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_return_output := BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1322_l1307_DUPLICATE_9be5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1322_l1307_DUPLICATE_9be5_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1301_l1293_l1308_l1316_DUPLICATE_9452 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1301_l1293_l1308_l1316_DUPLICATE_9452_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l1330_c34_6933] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1330_c34_6933_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1330_c34_6933_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1330_c34_6933_return_output := CONST_SR_8_uxn_opcodes_h_l1330_c34_6933_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1332_l1322_l1315_l1307_DUPLICATE_8026 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1332_l1322_l1315_l1307_DUPLICATE_8026_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1328_l1315_DUPLICATE_3332 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1328_l1315_DUPLICATE_3332_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1292_c11_7bf9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1320_c32_6165_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1283_c2_894a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1283_c2_894a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c6_cf22_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1289_c11_3874_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1292_c7_a039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1292_c7_a039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_7bf9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_ee1b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_a146_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1304_c7_83b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_911b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2b64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_45f1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c11_3007_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1315_c7_0c39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_a8a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_faeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1328_c11_5097_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1332_c11_3209_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1301_l1293_l1308_l1316_DUPLICATE_9452_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1301_l1293_l1308_l1316_DUPLICATE_9452_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1301_l1293_l1308_l1316_DUPLICATE_9452_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1326_c24_f2e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1315_l1307_DUPLICATE_b67d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1315_l1307_DUPLICATE_b67d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1315_l1307_DUPLICATE_b67d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1315_l1307_DUPLICATE_b67d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1315_l1307_DUPLICATE_b67d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1315_l1307_DUPLICATE_b67d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1315_l1307_DUPLICATE_b67d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1315_l1307_DUPLICATE_b67d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1315_l1307_DUPLICATE_b67d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1332_l1322_l1315_l1307_DUPLICATE_8026_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1332_l1322_l1315_l1307_DUPLICATE_8026_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1332_l1322_l1315_l1307_DUPLICATE_8026_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1332_l1322_l1315_l1307_DUPLICATE_8026_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1332_l1322_l1315_l1307_DUPLICATE_8026_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1332_l1322_l1315_l1307_DUPLICATE_8026_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1332_l1322_l1315_l1307_DUPLICATE_8026_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1332_l1322_l1315_l1307_DUPLICATE_8026_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1332_l1322_l1315_l1307_DUPLICATE_8026_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1332_l1322_l1315_l1307_DUPLICATE_8026_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1332_l1322_l1315_l1307_DUPLICATE_8026_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1322_l1307_DUPLICATE_9be5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1322_l1307_DUPLICATE_9be5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1322_l1307_DUPLICATE_9be5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1322_l1307_DUPLICATE_9be5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1322_l1307_DUPLICATE_9be5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1322_l1307_DUPLICATE_9be5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1322_l1307_DUPLICATE_9be5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1322_l1307_DUPLICATE_9be5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1283_l1322_l1307_DUPLICATE_9be5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1315_l1307_DUPLICATE_47b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1315_l1307_DUPLICATE_47b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1315_l1307_DUPLICATE_47b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1315_l1307_DUPLICATE_47b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1315_l1307_DUPLICATE_47b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1315_l1307_DUPLICATE_47b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1315_l1307_DUPLICATE_47b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1315_l1307_DUPLICATE_47b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1332_l1315_l1307_DUPLICATE_93e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1332_l1315_l1307_DUPLICATE_93e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1332_l1315_l1307_DUPLICATE_93e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1332_l1315_l1307_DUPLICATE_93e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1332_l1315_l1307_DUPLICATE_93e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1332_l1315_l1307_DUPLICATE_93e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1332_l1315_l1307_DUPLICATE_93e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1332_l1315_l1307_DUPLICATE_93e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1332_l1315_l1307_DUPLICATE_93e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1332_l1315_l1307_DUPLICATE_93e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1332_l1315_l1307_DUPLICATE_93e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1328_l1315_DUPLICATE_3332_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1328_l1315_DUPLICATE_3332_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1315_l1307_DUPLICATE_f462_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1315_l1307_DUPLICATE_f462_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1315_l1307_DUPLICATE_f462_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1315_l1307_DUPLICATE_f462_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1315_l1307_DUPLICATE_f462_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1315_l1307_DUPLICATE_f462_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1315_l1307_DUPLICATE_f462_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1315_l1307_DUPLICATE_f462_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1315_l1307_DUPLICATE_f462_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1312_l1304_l1300_l1297_l1292_l1289_l1328_l1283_l1315_l1307_DUPLICATE_f462_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1328_c7_227f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1330_c24_c770] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1330_c24_c770_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1330_c34_6933_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1316_c3_34b8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_left;
     BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_return_output := BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1322_c7_e629] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1332_c7_b4aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1320_c32_9680] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_left;
     BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_return_output := BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1332_c7_b4aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1301_c3_698f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_left;
     BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_return_output := BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1283_c1_5622] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1315_c7_0c39] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1320_c32_3954_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1320_c32_9680_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1301_c3_698f_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_34b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1330_c24_c770_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1294_l1309_DUPLICATE_e53c_return_output;
     VAR_printf_uxn_opcodes_h_l1284_c3_fbc5_uxn_opcodes_h_l1284_c3_fbc5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1283_c1_5622_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1332_c7_b4aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_e629_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1332_c7_b4aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1328_c7_227f_return_output;
     -- n16_MUX[uxn_opcodes_h_l1315_c7_0c39] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1315_c7_0c39_cond <= VAR_n16_MUX_uxn_opcodes_h_l1315_c7_0c39_cond;
     n16_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue;
     n16_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output := n16_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1315_c7_0c39] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;

     -- t16_MUX[uxn_opcodes_h_l1300_c7_0e19] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond <= VAR_t16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond;
     t16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue;
     t16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output := t16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1312_c7_d4d6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1328_c7_227f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_return_output;

     -- printf_uxn_opcodes_h_l1284_c3_fbc5[uxn_opcodes_h_l1284_c3_fbc5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1284_c3_fbc5_uxn_opcodes_h_l1284_c3_fbc5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1284_c3_fbc5_uxn_opcodes_h_l1284_c3_fbc5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1328_c7_227f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1317_c11_efe5] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1322_c7_e629] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1328_c7_227f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_return_output;

     -- MUX[uxn_opcodes_h_l1320_c32_3954] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1320_c32_3954_cond <= VAR_MUX_uxn_opcodes_h_l1320_c32_3954_cond;
     MUX_uxn_opcodes_h_l1320_c32_3954_iftrue <= VAR_MUX_uxn_opcodes_h_l1320_c32_3954_iftrue;
     MUX_uxn_opcodes_h_l1320_c32_3954_iffalse <= VAR_MUX_uxn_opcodes_h_l1320_c32_3954_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1320_c32_3954_return_output := MUX_uxn_opcodes_h_l1320_c32_3954_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1317_c3_e0f5 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1317_c11_efe5_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue := VAR_MUX_uxn_opcodes_h_l1320_c32_3954_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1328_c7_227f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1328_c7_227f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_e629_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1328_c7_227f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue := VAR_tmp16_uxn_opcodes_h_l1317_c3_e0f5;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1315_c7_0c39] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1315_c7_0c39] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_cond;
     tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output := tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1307_c7_2b64] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1322_c7_e629] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_return_output;

     -- n16_MUX[uxn_opcodes_h_l1312_c7_d4d6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond;
     n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue;
     n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output := n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1322_c7_e629] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_return_output := result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_return_output;

     -- t16_MUX[uxn_opcodes_h_l1297_c7_d3c1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond;
     t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue;
     t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output := t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1315_c7_0c39] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1312_c7_d4d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1322_c7_e629] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_e629_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_e629_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_e629_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1315_c7_0c39] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;

     -- t16_MUX[uxn_opcodes_h_l1292_c7_a039] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1292_c7_a039_cond <= VAR_t16_MUX_uxn_opcodes_h_l1292_c7_a039_cond;
     t16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue;
     t16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output := t16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1315_c7_0c39] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1312_c7_d4d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1304_c7_83b6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1312_c7_d4d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1307_c7_2b64] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1312_c7_d4d6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond;
     tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output := tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1307_c7_2b64] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1307_c7_2b64_cond <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2b64_cond;
     n16_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue;
     n16_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output := n16_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1315_c7_0c39] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output := result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_0c39_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1307_c7_2b64] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_cond;
     tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output := tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1300_c7_0e19] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_2b64] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1304_c7_83b6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1312_c7_d4d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1289_c7_f10b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond;
     t16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue;
     t16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output := t16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1312_c7_d4d6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1312_c7_d4d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1304_c7_83b6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1304_c7_83b6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1304_c7_83b6_cond;
     n16_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue;
     n16_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output := n16_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_2b64] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1312_c7_d4d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1304_c7_83b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1300_c7_0e19] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1307_c7_2b64] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output := result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1304_c7_83b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1304_c7_83b6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_cond;
     tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output := tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_2b64] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1297_c7_d3c1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_2b64] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;

     -- n16_MUX[uxn_opcodes_h_l1300_c7_0e19] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond;
     n16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue;
     n16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output := n16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;

     -- t16_MUX[uxn_opcodes_h_l1283_c2_894a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1283_c2_894a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1283_c2_894a_cond;
     t16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue;
     t16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output := t16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_2b64_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1304_c7_83b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1300_c7_0e19] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1304_c7_83b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1297_c7_d3c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1300_c7_0e19] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1292_c7_a039] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1304_c7_83b6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1297_c7_d3c1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond;
     n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue;
     n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output := n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1300_c7_0e19] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_cond;
     tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output := tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1304_c7_83b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1292_c7_a039] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1297_c7_d3c1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond;
     tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output := tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1292_c7_a039] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1292_c7_a039_cond <= VAR_n16_MUX_uxn_opcodes_h_l1292_c7_a039_cond;
     n16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue;
     n16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output := n16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1297_c7_d3c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1300_c7_0e19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1289_c7_f10b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1300_c7_0e19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1297_c7_d3c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1300_c7_0e19] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output := result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_0e19_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1297_c7_d3c1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1292_c7_a039] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1297_c7_d3c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1283_c2_894a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1292_c7_a039] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_cond;
     tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output := tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1292_c7_a039] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;

     -- n16_MUX[uxn_opcodes_h_l1289_c7_f10b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond;
     n16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue;
     n16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output := n16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1289_c7_f10b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1297_c7_d3c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_d3c1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1292_c7_a039] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_return_output := result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;

     -- n16_MUX[uxn_opcodes_h_l1283_c2_894a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1283_c2_894a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1283_c2_894a_cond;
     n16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue;
     n16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output := n16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1289_c7_f10b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_cond;
     tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output := tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1289_c7_f10b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1292_c7_a039] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1292_c7_a039] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1289_c7_f10b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1283_c2_894a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_a039_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1289_c7_f10b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1283_c2_894a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1289_c7_f10b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1283_c2_894a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_cond;
     tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output := tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1283_c2_894a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1289_c7_f10b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1289_c7_f10b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1283_c2_894a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1283_c2_894a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1283_c2_894a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1283_c2_894a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1337_l1279_DUPLICATE_9a6d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1337_l1279_DUPLICATE_9a6d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c2_894a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c2_894a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c2_894a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c2_894a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c2_894a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c2_894a_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c2_894a_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1337_l1279_DUPLICATE_9a6d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1337_l1279_DUPLICATE_9a6d_return_output;
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
