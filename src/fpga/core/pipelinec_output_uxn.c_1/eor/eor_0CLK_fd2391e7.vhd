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
entity eor_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor_0CLK_fd2391e7;
architecture arch of eor_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1208_c6_c3c7]
signal BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1208_c1_9743]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1208_c2_ba19]
signal t8_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1208_c2_ba19]
signal n8_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1208_c2_ba19]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1208_c2_ba19]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1208_c2_ba19]
signal result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1208_c2_ba19]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1208_c2_ba19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1208_c2_ba19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1208_c2_ba19]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1209_c3_5508[uxn_opcodes_h_l1209_c3_5508]
signal printf_uxn_opcodes_h_l1209_c3_5508_uxn_opcodes_h_l1209_c3_5508_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_f79e]
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1214_c7_8901]
signal t8_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1214_c7_8901]
signal n8_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1214_c7_8901]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c7_8901]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1214_c7_8901]
signal result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1214_c7_8901]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_8901]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_8901]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c7_8901]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1217_c11_2a6a]
signal BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1217_c7_3ef2]
signal t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1217_c7_3ef2]
signal n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1217_c7_3ef2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1217_c7_3ef2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1217_c7_3ef2]
signal result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1217_c7_3ef2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1217_c7_3ef2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1217_c7_3ef2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1217_c7_3ef2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1221_c11_94b2]
signal BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1221_c7_fa3d]
signal n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1221_c7_fa3d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1221_c7_fa3d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1221_c7_fa3d]
signal result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1221_c7_fa3d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1221_c7_fa3d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1221_c7_fa3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1221_c7_fa3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1224_c11_df35]
signal BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1224_c7_4ff1]
signal n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1224_c7_4ff1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1224_c7_4ff1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1224_c7_4ff1]
signal result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1224_c7_4ff1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1224_c7_4ff1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1224_c7_4ff1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1224_c7_4ff1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1228_c32_dd7e]
signal BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1228_c32_1249]
signal BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1228_c32_8a9d]
signal MUX_uxn_opcodes_h_l1228_c32_8a9d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1228_c32_8a9d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1228_c32_8a9d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1228_c32_8a9d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1230_c11_7403]
signal BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1230_c7_917c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1230_c7_917c]
signal result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1230_c7_917c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1230_c7_917c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1230_c7_917c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1234_c24_32d6]
signal BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1236_c11_e121]
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1236_c7_6e6c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1236_c7_6e6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7
BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_left,
BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_right,
BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_return_output);

-- t8_MUX_uxn_opcodes_h_l1208_c2_ba19
t8_MUX_uxn_opcodes_h_l1208_c2_ba19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1208_c2_ba19_cond,
t8_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue,
t8_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse,
t8_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output);

-- n8_MUX_uxn_opcodes_h_l1208_c2_ba19
n8_MUX_uxn_opcodes_h_l1208_c2_ba19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1208_c2_ba19_cond,
n8_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue,
n8_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse,
n8_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19
result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19
result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19
result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_cond,
result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19
result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19
result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19
result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output);

-- printf_uxn_opcodes_h_l1209_c3_5508_uxn_opcodes_h_l1209_c3_5508
printf_uxn_opcodes_h_l1209_c3_5508_uxn_opcodes_h_l1209_c3_5508 : entity work.printf_uxn_opcodes_h_l1209_c3_5508_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1209_c3_5508_uxn_opcodes_h_l1209_c3_5508_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_left,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_right,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_return_output);

-- t8_MUX_uxn_opcodes_h_l1214_c7_8901
t8_MUX_uxn_opcodes_h_l1214_c7_8901 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1214_c7_8901_cond,
t8_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue,
t8_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse,
t8_MUX_uxn_opcodes_h_l1214_c7_8901_return_output);

-- n8_MUX_uxn_opcodes_h_l1214_c7_8901
n8_MUX_uxn_opcodes_h_l1214_c7_8901 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1214_c7_8901_cond,
n8_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue,
n8_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse,
n8_MUX_uxn_opcodes_h_l1214_c7_8901_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901
result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901
result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_cond,
result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_left,
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_right,
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_return_output);

-- t8_MUX_uxn_opcodes_h_l1217_c7_3ef2
t8_MUX_uxn_opcodes_h_l1217_c7_3ef2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond,
t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue,
t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse,
t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output);

-- n8_MUX_uxn_opcodes_h_l1217_c7_3ef2
n8_MUX_uxn_opcodes_h_l1217_c7_3ef2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond,
n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue,
n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse,
n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2
result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2
result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2
BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_left,
BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_right,
BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_return_output);

-- n8_MUX_uxn_opcodes_h_l1221_c7_fa3d
n8_MUX_uxn_opcodes_h_l1221_c7_fa3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond,
n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue,
n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse,
n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d
result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d
result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d
result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d
result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d
result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35
BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_left,
BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_right,
BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_return_output);

-- n8_MUX_uxn_opcodes_h_l1224_c7_4ff1
n8_MUX_uxn_opcodes_h_l1224_c7_4ff1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond,
n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue,
n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse,
n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1
result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1
result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1
result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1
result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1
result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e
BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_left,
BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_right,
BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249
BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_left,
BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_right,
BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_return_output);

-- MUX_uxn_opcodes_h_l1228_c32_8a9d
MUX_uxn_opcodes_h_l1228_c32_8a9d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1228_c32_8a9d_cond,
MUX_uxn_opcodes_h_l1228_c32_8a9d_iftrue,
MUX_uxn_opcodes_h_l1228_c32_8a9d_iffalse,
MUX_uxn_opcodes_h_l1228_c32_8a9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403
BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_left,
BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_right,
BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c
result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c
result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c
result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c
result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6
BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_left,
BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_right,
BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_left,
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_right,
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_return_output,
 t8_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output,
 n8_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_return_output,
 t8_MUX_uxn_opcodes_h_l1214_c7_8901_return_output,
 n8_MUX_uxn_opcodes_h_l1214_c7_8901_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_return_output,
 t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output,
 n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_return_output,
 n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_return_output,
 n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_return_output,
 MUX_uxn_opcodes_h_l1228_c32_8a9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_c1b0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1209_c3_5508_uxn_opcodes_h_l1209_c3_5508_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1215_c3_36c5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1219_c3_1180 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1222_c3_6e19 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1228_c32_8a9d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1228_c32_8a9d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1228_c32_8a9d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1228_c32_8a9d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_5d42 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1214_l1208_l1224_l1221_l1217_DUPLICATE_563c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1214_l1208_l1230_l1224_l1221_l1217_DUPLICATE_715f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1214_l1208_l1230_l1221_l1217_DUPLICATE_9d69_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1214_l1208_l1236_l1224_l1221_l1217_DUPLICATE_84af_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1221_l1214_l1224_l1217_DUPLICATE_eb48_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1214_l1236_l1230_l1224_l1221_l1217_DUPLICATE_2c6f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1224_l1230_DUPLICATE_ef80_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1241_l1204_DUPLICATE_4406_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1219_c3_1180 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1219_c3_1180;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1215_c3_36c5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1215_c3_36c5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_5d42 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_5d42;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1222_c3_6e19 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1222_c3_6e19;
     VAR_MUX_uxn_opcodes_h_l1228_c32_8a9d_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_c1b0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_c1b0;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1228_c32_8a9d_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_left := VAR_ins;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1230_c11_7403] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_left;
     BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_return_output := BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_f79e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1208_c6_c3c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1214_l1208_l1230_l1221_l1217_DUPLICATE_9d69 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1214_l1208_l1230_l1221_l1217_DUPLICATE_9d69_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1224_c11_df35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_left;
     BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_return_output := BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1214_l1236_l1230_l1224_l1221_l1217_DUPLICATE_2c6f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1214_l1236_l1230_l1224_l1221_l1217_DUPLICATE_2c6f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1221_c11_94b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1234_c24_32d6] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_left;
     BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_return_output := BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1217_c11_2a6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1214_l1208_l1236_l1224_l1221_l1217_DUPLICATE_84af LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1214_l1208_l1236_l1224_l1221_l1217_DUPLICATE_84af_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1214_l1208_l1230_l1224_l1221_l1217_DUPLICATE_715f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1214_l1208_l1230_l1224_l1221_l1217_DUPLICATE_715f_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l1228_c32_dd7e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_left;
     BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_return_output := BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1221_l1214_l1224_l1217_DUPLICATE_eb48 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1221_l1214_l1224_l1217_DUPLICATE_eb48_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1236_c11_e121] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_left;
     BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_return_output := BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1214_l1208_l1224_l1221_l1217_DUPLICATE_563c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1214_l1208_l1224_l1221_l1217_DUPLICATE_563c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1224_l1230_DUPLICATE_ef80 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1224_l1230_DUPLICATE_ef80_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1228_c32_dd7e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1208_c2_ba19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1208_c2_ba19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1208_c6_c3c7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1214_c7_8901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1214_c7_8901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_f79e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_2a6a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1221_c11_94b2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1224_c11_df35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_7403_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_e121_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1234_c24_32d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1214_l1208_l1224_l1221_l1217_DUPLICATE_563c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1214_l1208_l1224_l1221_l1217_DUPLICATE_563c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1214_l1208_l1224_l1221_l1217_DUPLICATE_563c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1214_l1208_l1224_l1221_l1217_DUPLICATE_563c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1214_l1208_l1224_l1221_l1217_DUPLICATE_563c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1214_l1236_l1230_l1224_l1221_l1217_DUPLICATE_2c6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1214_l1236_l1230_l1224_l1221_l1217_DUPLICATE_2c6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1214_l1236_l1230_l1224_l1221_l1217_DUPLICATE_2c6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1214_l1236_l1230_l1224_l1221_l1217_DUPLICATE_2c6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1214_l1236_l1230_l1224_l1221_l1217_DUPLICATE_2c6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1214_l1236_l1230_l1224_l1221_l1217_DUPLICATE_2c6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1214_l1208_l1230_l1221_l1217_DUPLICATE_9d69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1214_l1208_l1230_l1221_l1217_DUPLICATE_9d69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1214_l1208_l1230_l1221_l1217_DUPLICATE_9d69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1214_l1208_l1230_l1221_l1217_DUPLICATE_9d69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1214_l1208_l1230_l1221_l1217_DUPLICATE_9d69_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1221_l1214_l1224_l1217_DUPLICATE_eb48_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1221_l1214_l1224_l1217_DUPLICATE_eb48_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1221_l1214_l1224_l1217_DUPLICATE_eb48_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1221_l1214_l1224_l1217_DUPLICATE_eb48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1214_l1208_l1236_l1224_l1221_l1217_DUPLICATE_84af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1214_l1208_l1236_l1224_l1221_l1217_DUPLICATE_84af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1214_l1208_l1236_l1224_l1221_l1217_DUPLICATE_84af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1214_l1208_l1236_l1224_l1221_l1217_DUPLICATE_84af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1214_l1208_l1236_l1224_l1221_l1217_DUPLICATE_84af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1214_l1208_l1236_l1224_l1221_l1217_DUPLICATE_84af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1224_l1230_DUPLICATE_ef80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1224_l1230_DUPLICATE_ef80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1214_l1208_l1230_l1224_l1221_l1217_DUPLICATE_715f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1214_l1208_l1230_l1224_l1221_l1217_DUPLICATE_715f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1214_l1208_l1230_l1224_l1221_l1217_DUPLICATE_715f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1214_l1208_l1230_l1224_l1221_l1217_DUPLICATE_715f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1214_l1208_l1230_l1224_l1221_l1217_DUPLICATE_715f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1214_l1208_l1230_l1224_l1221_l1217_DUPLICATE_715f_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1224_c7_4ff1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output;

     -- t8_MUX[uxn_opcodes_h_l1217_c7_3ef2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond <= VAR_t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond;
     t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue;
     t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output := t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1230_c7_917c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1230_c7_917c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1228_c32_1249] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_left;
     BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_return_output := BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1236_c7_6e6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1230_c7_917c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_return_output;

     -- n8_MUX[uxn_opcodes_h_l1224_c7_4ff1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond <= VAR_n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond;
     n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue;
     n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output := n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1236_c7_6e6c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1208_c1_9743] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1228_c32_8a9d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1228_c32_1249_return_output;
     VAR_printf_uxn_opcodes_h_l1209_c3_5508_uxn_opcodes_h_l1209_c3_5508_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1208_c1_9743_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6e6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1230_c7_917c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6e6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_917c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1230_c7_917c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;
     -- MUX[uxn_opcodes_h_l1228_c32_8a9d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1228_c32_8a9d_cond <= VAR_MUX_uxn_opcodes_h_l1228_c32_8a9d_cond;
     MUX_uxn_opcodes_h_l1228_c32_8a9d_iftrue <= VAR_MUX_uxn_opcodes_h_l1228_c32_8a9d_iftrue;
     MUX_uxn_opcodes_h_l1228_c32_8a9d_iffalse <= VAR_MUX_uxn_opcodes_h_l1228_c32_8a9d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1228_c32_8a9d_return_output := MUX_uxn_opcodes_h_l1228_c32_8a9d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1224_c7_4ff1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1230_c7_917c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1224_c7_4ff1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1230_c7_917c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_return_output;

     -- n8_MUX[uxn_opcodes_h_l1221_c7_fa3d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond;
     n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue;
     n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output := n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1214_c7_8901] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1214_c7_8901_cond <= VAR_t8_MUX_uxn_opcodes_h_l1214_c7_8901_cond;
     t8_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue;
     t8_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1214_c7_8901_return_output := t8_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1224_c7_4ff1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output;

     -- printf_uxn_opcodes_h_l1209_c3_5508[uxn_opcodes_h_l1209_c3_5508] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1209_c3_5508_uxn_opcodes_h_l1209_c3_5508_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1209_c3_5508_uxn_opcodes_h_l1209_c3_5508_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1221_c7_fa3d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue := VAR_MUX_uxn_opcodes_h_l1228_c32_8a9d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_917c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_917c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1224_c7_4ff1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1221_c7_fa3d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1217_c7_3ef2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond <= VAR_n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond;
     n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue;
     n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output := n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1224_c7_4ff1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1221_c7_fa3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1208_c2_ba19] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1208_c2_ba19_cond <= VAR_t8_MUX_uxn_opcodes_h_l1208_c2_ba19_cond;
     t8_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue;
     t8_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output := t8_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1217_c7_3ef2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1224_c7_4ff1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1221_c7_fa3d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1224_c7_4ff1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1221_c7_fa3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1217_c7_3ef2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1221_c7_fa3d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1221_c7_fa3d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1217_c7_3ef2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1217_c7_3ef2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;

     -- n8_MUX[uxn_opcodes_h_l1214_c7_8901] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1214_c7_8901_cond <= VAR_n8_MUX_uxn_opcodes_h_l1214_c7_8901_cond;
     n8_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue;
     n8_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1214_c7_8901_return_output := n8_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1214_c7_8901] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1221_c7_fa3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1217_c7_3ef2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1217_c7_3ef2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1214_c7_8901] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c7_8901] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1217_c7_3ef2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1208_c2_ba19] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1214_c7_8901] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_return_output := result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;

     -- n8_MUX[uxn_opcodes_h_l1208_c2_ba19] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1208_c2_ba19_cond <= VAR_n8_MUX_uxn_opcodes_h_l1208_c2_ba19_cond;
     n8_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue;
     n8_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output := n8_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_3ef2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_8901] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1208_c2_ba19] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1208_c2_ba19] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output := result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1208_c2_ba19] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c7_8901] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_8901] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_8901_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1208_c2_ba19] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1208_c2_ba19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1208_c2_ba19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1241_l1204_DUPLICATE_4406 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1241_l1204_DUPLICATE_4406_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1208_c2_ba19_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1241_l1204_DUPLICATE_4406_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1241_l1204_DUPLICATE_4406_return_output;
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
