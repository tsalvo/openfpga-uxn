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
-- Submodules: 77
entity inc2_0CLK_26f67814 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc2_0CLK_26f67814;
architecture arch of inc2_0CLK_26f67814 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1365_c6_e26d]
signal BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1365_c1_6f43]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1365_c2_f34c]
signal result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1365_c2_f34c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1365_c2_f34c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1365_c2_f34c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1365_c2_f34c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1365_c2_f34c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1365_c2_f34c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1365_c2_f34c]
signal tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1365_c2_f34c]
signal t16_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1366_c3_a31f[uxn_opcodes_h_l1366_c3_a31f]
signal printf_uxn_opcodes_h_l1366_c3_a31f_uxn_opcodes_h_l1366_c3_a31f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1371_c11_6554]
signal BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1371_c7_521a]
signal result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1371_c7_521a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1371_c7_521a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1371_c7_521a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1371_c7_521a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1371_c7_521a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1371_c7_521a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1371_c7_521a]
signal tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1371_c7_521a]
signal t16_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1374_c11_4764]
signal BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1374_c7_3ff3]
signal result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1374_c7_3ff3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1374_c7_3ff3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1374_c7_3ff3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1374_c7_3ff3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1374_c7_3ff3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1374_c7_3ff3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1374_c7_3ff3]
signal tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1374_c7_3ff3]
signal t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1376_c3_caa4]
signal CONST_SL_8_uxn_opcodes_h_l1376_c3_caa4_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1376_c3_caa4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1379_c11_c7cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1379_c7_1744]
signal result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1379_c7_1744]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1379_c7_1744]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1379_c7_1744]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1379_c7_1744]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1379_c7_1744]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1379_c7_1744]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1379_c7_1744]
signal tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1379_c7_1744]
signal t16_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1382_c11_2b53]
signal BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1382_c7_93d2]
signal result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1382_c7_93d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1382_c7_93d2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1382_c7_93d2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1382_c7_93d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1382_c7_93d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1382_c7_93d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1382_c7_93d2]
signal tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1382_c7_93d2]
signal t16_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1383_c3_61cc]
signal BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1384_c11_a927]
signal BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1387_c32_84e4]
signal BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1387_c32_49e5]
signal BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1387_c32_2471]
signal MUX_uxn_opcodes_h_l1387_c32_2471_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1387_c32_2471_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1387_c32_2471_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1387_c32_2471_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1389_c11_1de9]
signal BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1389_c7_4e3a]
signal result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1389_c7_4e3a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1389_c7_4e3a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1389_c7_4e3a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1389_c7_4e3a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1395_c11_fe76]
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1395_c7_1e73]
signal result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1395_c7_1e73]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1395_c7_1e73]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1395_c7_1e73]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1397_c34_8f01]
signal CONST_SR_8_uxn_opcodes_h_l1397_c34_8f01_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1397_c34_8f01_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1399_c11_1eb6]
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1399_c7_62b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1399_c7_62b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d
BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_left,
BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_right,
BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c
result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c
result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c
tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_cond,
tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output);

-- t16_MUX_uxn_opcodes_h_l1365_c2_f34c
t16_MUX_uxn_opcodes_h_l1365_c2_f34c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1365_c2_f34c_cond,
t16_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue,
t16_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse,
t16_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output);

-- printf_uxn_opcodes_h_l1366_c3_a31f_uxn_opcodes_h_l1366_c3_a31f
printf_uxn_opcodes_h_l1366_c3_a31f_uxn_opcodes_h_l1366_c3_a31f : entity work.printf_uxn_opcodes_h_l1366_c3_a31f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1366_c3_a31f_uxn_opcodes_h_l1366_c3_a31f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554
BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_left,
BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_right,
BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a
result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a
result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a
result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1371_c7_521a
tmp16_MUX_uxn_opcodes_h_l1371_c7_521a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_cond,
tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_return_output);

-- t16_MUX_uxn_opcodes_h_l1371_c7_521a
t16_MUX_uxn_opcodes_h_l1371_c7_521a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1371_c7_521a_cond,
t16_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue,
t16_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse,
t16_MUX_uxn_opcodes_h_l1371_c7_521a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764
BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_left,
BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_right,
BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3
result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3
result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3
result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3
result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3
result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3
tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond,
tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output);

-- t16_MUX_uxn_opcodes_h_l1374_c7_3ff3
t16_MUX_uxn_opcodes_h_l1374_c7_3ff3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond,
t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue,
t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse,
t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1376_c3_caa4
CONST_SL_8_uxn_opcodes_h_l1376_c3_caa4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1376_c3_caa4_x,
CONST_SL_8_uxn_opcodes_h_l1376_c3_caa4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc
BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744
result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_cond,
result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744
result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744
result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744
result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744
result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744
result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1379_c7_1744
tmp16_MUX_uxn_opcodes_h_l1379_c7_1744 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_cond,
tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue,
tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse,
tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_return_output);

-- t16_MUX_uxn_opcodes_h_l1379_c7_1744
t16_MUX_uxn_opcodes_h_l1379_c7_1744 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1379_c7_1744_cond,
t16_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue,
t16_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse,
t16_MUX_uxn_opcodes_h_l1379_c7_1744_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53
BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_left,
BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_right,
BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2
result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2
result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2
result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2
result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2
result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2
tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_cond,
tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output);

-- t16_MUX_uxn_opcodes_h_l1382_c7_93d2
t16_MUX_uxn_opcodes_h_l1382_c7_93d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1382_c7_93d2_cond,
t16_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue,
t16_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse,
t16_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc
BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_left,
BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_right,
BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927
BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_left,
BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_right,
BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4
BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_left,
BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_right,
BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5
BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_left,
BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_right,
BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_return_output);

-- MUX_uxn_opcodes_h_l1387_c32_2471
MUX_uxn_opcodes_h_l1387_c32_2471 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1387_c32_2471_cond,
MUX_uxn_opcodes_h_l1387_c32_2471_iftrue,
MUX_uxn_opcodes_h_l1387_c32_2471_iffalse,
MUX_uxn_opcodes_h_l1387_c32_2471_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_left,
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_right,
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a
result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76
BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_left,
BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_right,
BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73
result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_cond,
result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1397_c34_8f01
CONST_SR_8_uxn_opcodes_h_l1397_c34_8f01 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1397_c34_8f01_x,
CONST_SR_8_uxn_opcodes_h_l1397_c34_8f01_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_left,
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_right,
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output,
 t16_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_return_output,
 t16_MUX_uxn_opcodes_h_l1371_c7_521a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output,
 t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output,
 CONST_SL_8_uxn_opcodes_h_l1376_c3_caa4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_return_output,
 tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_return_output,
 t16_MUX_uxn_opcodes_h_l1379_c7_1744_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output,
 t16_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_return_output,
 MUX_uxn_opcodes_h_l1387_c32_2471_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output,
 CONST_SR_8_uxn_opcodes_h_l1397_c34_8f01_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_8a93 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1371_c7_521a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1365_c2_f34c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1366_c3_a31f_uxn_opcodes_h_l1366_c3_a31f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1372_c3_1d6a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1371_c7_521a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1377_c3_1ce2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1379_c7_1744_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1376_c3_caa4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1376_c3_caa4_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1380_c3_e83c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1379_c7_1744_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1384_c3_aaa7 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1382_c7_93d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1387_c32_2471_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1387_c32_2471_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1387_c32_2471_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1387_c32_2471_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1392_c3_7aaf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1393_c24_876e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1396_c3_6a76 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1397_c34_8f01_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1397_c34_8f01_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1397_c24_6380_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_cc06_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1365_l1389_l1379_l1374_l1371_DUPLICATE_e861_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1365_l1382_l1379_l1374_l1371_DUPLICATE_9c87_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1399_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_c711_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1374_l1379_l1371_l1382_DUPLICATE_c896_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1399_l1395_l1389_l1382_l1379_l1374_l1371_DUPLICATE_725f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1375_l1383_DUPLICATE_c8a5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1395_l1382_DUPLICATE_969e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1361_l1404_DUPLICATE_17f6_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1372_c3_1d6a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1372_c3_1d6a;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_8a93 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_8a93;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1387_c32_2471_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1380_c3_e83c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1380_c3_e83c;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1392_c3_7aaf := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1392_c3_7aaf;
     VAR_MUX_uxn_opcodes_h_l1387_c32_2471_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1377_c3_1ce2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1377_c3_1ce2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1396_c3_6a76 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1396_c3_6a76;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1397_c34_8f01_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1365_l1389_l1379_l1374_l1371_DUPLICATE_e861 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1365_l1389_l1379_l1374_l1371_DUPLICATE_e861_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1371_c11_6554] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_left;
     BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_return_output := BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_cc06 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_cc06_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1395_l1382_DUPLICATE_969e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1395_l1382_DUPLICATE_969e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1399_c11_1eb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1397_c34_8f01] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1397_c34_8f01_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1397_c34_8f01_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1397_c34_8f01_return_output := CONST_SR_8_uxn_opcodes_h_l1397_c34_8f01_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1387_c32_84e4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_left;
     BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_return_output := BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1399_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_c711 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1399_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_c711_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1395_c11_fe76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_left;
     BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_return_output := BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1374_l1379_l1371_l1382_DUPLICATE_c896 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1374_l1379_l1371_l1382_DUPLICATE_c896_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1389_c11_1de9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1399_l1395_l1389_l1382_l1379_l1374_l1371_DUPLICATE_725f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1399_l1395_l1389_l1382_l1379_l1374_l1371_DUPLICATE_725f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1382_c11_2b53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_left;
     BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_return_output := BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1365_l1382_l1379_l1374_l1371_DUPLICATE_9c87 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1365_l1382_l1379_l1374_l1371_DUPLICATE_9c87_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1374_c11_4764] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_left;
     BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_return_output := BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1365_c6_e26d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1375_l1383_DUPLICATE_c8a5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1375_l1383_DUPLICATE_c8a5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1379_c11_c7cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1393_c24_876e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1393_c24_876e_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1387_c32_84e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1365_c2_f34c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c6_e26d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1371_c7_521a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_6554_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1374_c11_4764_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1379_c7_1744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c11_c7cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1382_c7_93d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1382_c11_2b53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_1de9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_fe76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_1eb6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1375_l1383_DUPLICATE_c8a5_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1376_c3_caa4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1375_l1383_DUPLICATE_c8a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1393_c24_876e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1365_l1382_l1379_l1374_l1371_DUPLICATE_9c87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1365_l1382_l1379_l1374_l1371_DUPLICATE_9c87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1365_l1382_l1379_l1374_l1371_DUPLICATE_9c87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1365_l1382_l1379_l1374_l1371_DUPLICATE_9c87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1365_l1382_l1379_l1374_l1371_DUPLICATE_9c87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1399_l1395_l1389_l1382_l1379_l1374_l1371_DUPLICATE_725f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1399_l1395_l1389_l1382_l1379_l1374_l1371_DUPLICATE_725f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1399_l1395_l1389_l1382_l1379_l1374_l1371_DUPLICATE_725f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1399_l1395_l1389_l1382_l1379_l1374_l1371_DUPLICATE_725f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1399_l1395_l1389_l1382_l1379_l1374_l1371_DUPLICATE_725f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1399_l1395_l1389_l1382_l1379_l1374_l1371_DUPLICATE_725f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1399_l1395_l1389_l1382_l1379_l1374_l1371_DUPLICATE_725f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1365_l1389_l1379_l1374_l1371_DUPLICATE_e861_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1365_l1389_l1379_l1374_l1371_DUPLICATE_e861_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1365_l1389_l1379_l1374_l1371_DUPLICATE_e861_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1365_l1389_l1379_l1374_l1371_DUPLICATE_e861_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1365_l1389_l1379_l1374_l1371_DUPLICATE_e861_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1374_l1379_l1371_l1382_DUPLICATE_c896_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1374_l1379_l1371_l1382_DUPLICATE_c896_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1374_l1379_l1371_l1382_DUPLICATE_c896_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1374_l1379_l1371_l1382_DUPLICATE_c896_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1399_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_c711_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1399_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_c711_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1399_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_c711_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1399_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_c711_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1399_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_c711_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1399_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_c711_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1399_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_c711_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1395_l1382_DUPLICATE_969e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1395_l1382_DUPLICATE_969e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_cc06_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_cc06_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_cc06_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_cc06_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_cc06_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1365_l1395_l1382_l1379_l1374_l1371_DUPLICATE_cc06_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l1376_c3_caa4] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1376_c3_caa4_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1376_c3_caa4_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1376_c3_caa4_return_output := CONST_SL_8_uxn_opcodes_h_l1376_c3_caa4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1383_c3_61cc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_left;
     BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_return_output := BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1399_c7_62b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1389_c7_4e3a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1397_c24_6380] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1397_c24_6380_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1397_c34_8f01_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1399_c7_62b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1395_c7_1e73] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1365_c1_6f43] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1387_c32_49e5] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_left;
     BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_return_output := BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1382_c7_93d2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1387_c32_2471_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1387_c32_49e5_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1383_c3_61cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1397_c24_6380_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1376_c3_caa4_return_output;
     VAR_printf_uxn_opcodes_h_l1366_c3_a31f_uxn_opcodes_h_l1366_c3_a31f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1365_c1_6f43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_62b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_62b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output;
     -- t16_MUX[uxn_opcodes_h_l1382_c7_93d2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1382_c7_93d2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1382_c7_93d2_cond;
     t16_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue;
     t16_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output := t16_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1389_c7_4e3a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1379_c7_1744] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1384_c11_a927] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1395_c7_1e73] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1382_c7_93d2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;

     -- printf_uxn_opcodes_h_l1366_c3_a31f[uxn_opcodes_h_l1366_c3_a31f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1366_c3_a31f_uxn_opcodes_h_l1366_c3_a31f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1366_c3_a31f_uxn_opcodes_h_l1366_c3_a31f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l1395_c7_1e73] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output := result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1395_c7_1e73] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output;

     -- MUX[uxn_opcodes_h_l1387_c32_2471] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1387_c32_2471_cond <= VAR_MUX_uxn_opcodes_h_l1387_c32_2471_cond;
     MUX_uxn_opcodes_h_l1387_c32_2471_iftrue <= VAR_MUX_uxn_opcodes_h_l1387_c32_2471_iftrue;
     MUX_uxn_opcodes_h_l1387_c32_2471_iffalse <= VAR_MUX_uxn_opcodes_h_l1387_c32_2471_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1387_c32_2471_return_output := MUX_uxn_opcodes_h_l1387_c32_2471_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1384_c3_aaa7 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1384_c11_a927_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue := VAR_MUX_uxn_opcodes_h_l1387_c32_2471_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_1e73_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue := VAR_tmp16_uxn_opcodes_h_l1384_c3_aaa7;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1379_c7_1744] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1389_c7_4e3a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1374_c7_3ff3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1389_c7_4e3a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1382_c7_93d2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_cond;
     tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output := tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1379_c7_1744] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1379_c7_1744_cond <= VAR_t16_MUX_uxn_opcodes_h_l1379_c7_1744_cond;
     t16_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue;
     t16_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1379_c7_1744_return_output := t16_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1389_c7_4e3a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1382_c7_93d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1382_c7_93d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_4e3a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;
     -- t16_MUX[uxn_opcodes_h_l1374_c7_3ff3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond;
     t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue;
     t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output := t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1379_c7_1744] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1382_c7_93d2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1371_c7_521a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1382_c7_93d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1382_c7_93d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1379_c7_1744] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1379_c7_1744] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_cond;
     tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_return_output := tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1374_c7_3ff3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1382_c7_93d2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1374_c7_3ff3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1374_c7_3ff3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond;
     tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output := tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1379_c7_1744] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_return_output := result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1365_c2_f34c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1379_c7_1744] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;

     -- t16_MUX[uxn_opcodes_h_l1371_c7_521a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1371_c7_521a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1371_c7_521a_cond;
     t16_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue;
     t16_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1371_c7_521a_return_output := t16_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1379_c7_1744] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1371_c7_521a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1374_c7_3ff3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c7_1744_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1374_c7_3ff3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1374_c7_3ff3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1371_c7_521a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1365_c2_f34c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1374_c7_3ff3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1371_c7_521a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1371_c7_521a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_cond;
     tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_return_output := tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1365_c2_f34c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1365_c2_f34c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1365_c2_f34c_cond;
     t16_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue;
     t16_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output := t16_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1374_c7_3ff3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1365_c2_f34c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1365_c2_f34c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1365_c2_f34c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_cond;
     tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output := tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1371_c7_521a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1371_c7_521a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1371_c7_521a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1371_c7_521a_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1365_c2_f34c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1365_c2_f34c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1365_c2_f34c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1361_l1404_DUPLICATE_17f6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1361_l1404_DUPLICATE_17f6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c2_f34c_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1361_l1404_DUPLICATE_17f6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1361_l1404_DUPLICATE_17f6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
