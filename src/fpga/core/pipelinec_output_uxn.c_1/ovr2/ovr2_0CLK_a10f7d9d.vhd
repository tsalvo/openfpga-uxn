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
-- Submodules: 121
entity ovr2_0CLK_a10f7d9d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_a10f7d9d;
architecture arch of ovr2_0CLK_a10f7d9d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l345_c6_e429]
signal BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l345_c1_9b23]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l345_c2_5d29]
signal n16_MUX_uxn_opcodes_h_l345_c2_5d29_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c2_5d29_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l345_c2_5d29]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l345_c2_5d29]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l345_c2_5d29]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l345_c2_5d29]
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l345_c2_5d29]
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l345_c2_5d29]
signal result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l345_c2_5d29]
signal t16_MUX_uxn_opcodes_h_l345_c2_5d29_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l345_c2_5d29_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l346_c3_680b[uxn_opcodes_h_l346_c3_680b]
signal printf_uxn_opcodes_h_l346_c3_680b_uxn_opcodes_h_l346_c3_680b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l350_c11_545e]
signal BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l350_c7_e99c]
signal n16_MUX_uxn_opcodes_h_l350_c7_e99c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l350_c7_e99c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l350_c7_e99c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l350_c7_e99c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l350_c7_e99c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l350_c7_e99c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l350_c7_e99c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l350_c7_e99c]
signal result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l350_c7_e99c]
signal t16_MUX_uxn_opcodes_h_l350_c7_e99c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l350_c7_e99c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l353_c11_eedf]
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l353_c7_a448]
signal n16_MUX_uxn_opcodes_h_l353_c7_a448_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_a448_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_a448_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_a448_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l353_c7_a448]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l353_c7_a448]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l353_c7_a448]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l353_c7_a448]
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l353_c7_a448]
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l353_c7_a448]
signal result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l353_c7_a448]
signal t16_MUX_uxn_opcodes_h_l353_c7_a448_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_a448_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_a448_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_a448_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l358_c11_d3e9]
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l358_c7_2ec8]
signal n16_MUX_uxn_opcodes_h_l358_c7_2ec8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l358_c7_2ec8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l358_c7_2ec8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l358_c7_2ec8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l358_c7_2ec8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l358_c7_2ec8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l358_c7_2ec8]
signal result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l358_c7_2ec8]
signal t16_MUX_uxn_opcodes_h_l358_c7_2ec8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l361_c11_71e7]
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l361_c7_06af]
signal n16_MUX_uxn_opcodes_h_l361_c7_06af_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_06af_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_06af_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_06af_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l361_c7_06af]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l361_c7_06af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l361_c7_06af]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l361_c7_06af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l361_c7_06af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l361_c7_06af]
signal result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l361_c7_06af]
signal t16_MUX_uxn_opcodes_h_l361_c7_06af_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_06af_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_06af_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_06af_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l362_c3_3d04]
signal BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l365_c11_ebb0]
signal BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l365_c7_08fc]
signal n16_MUX_uxn_opcodes_h_l365_c7_08fc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l365_c7_08fc_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l365_c7_08fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l365_c7_08fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l365_c7_08fc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l365_c7_08fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l365_c7_08fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l365_c7_08fc]
signal result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l368_c11_cb6e]
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l368_c7_39e9]
signal n16_MUX_uxn_opcodes_h_l368_c7_39e9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_39e9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l368_c7_39e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_39e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l368_c7_39e9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_39e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_39e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l368_c7_39e9]
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l373_c11_84a2]
signal BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l373_c7_6de0]
signal n16_MUX_uxn_opcodes_h_l373_c7_6de0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l373_c7_6de0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l373_c7_6de0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l373_c7_6de0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l373_c7_6de0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l373_c7_6de0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l373_c7_6de0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l373_c7_6de0]
signal result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_4fb6]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l376_c7_a727]
signal n16_MUX_uxn_opcodes_h_l376_c7_a727_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_a727_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_a727_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_a727_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l376_c7_a727]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_a727]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l376_c7_a727]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_a727]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l376_c7_a727]
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_a727]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l377_c3_d91b]
signal BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l379_c30_b75e]
signal sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_406c]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_5f35]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l384_c7_5f35]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_5f35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l384_c7_5f35]
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l384_c7_5f35]
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l389_c11_8038]
signal BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l389_c7_fcb3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l389_c7_fcb3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l389_c7_fcb3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l389_c7_fcb3]
signal result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l393_c11_80c5]
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l393_c7_77f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l393_c7_77f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l393_c7_77f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l393_c7_77f0]
signal result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l395_c31_9121]
signal CONST_SR_8_uxn_opcodes_h_l395_c31_9121_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l395_c31_9121_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l397_c11_d6c3]
signal BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l397_c7_58be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l397_c7_58be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l397_c7_58be]
signal result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l397_c7_58be]
signal result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l401_c11_02e3]
signal BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l401_c7_6ea4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l401_c7_6ea4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l401_c7_6ea4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l401_c7_6ea4]
signal result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l405_c11_cef7]
signal BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l405_c7_47b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l405_c7_47b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_67aa
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_67aa_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_67aa_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429
BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_left,
BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_right,
BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_return_output);

-- n16_MUX_uxn_opcodes_h_l345_c2_5d29
n16_MUX_uxn_opcodes_h_l345_c2_5d29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l345_c2_5d29_cond,
n16_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue,
n16_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse,
n16_MUX_uxn_opcodes_h_l345_c2_5d29_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29
result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29
result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29
result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_cond,
result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_return_output);

-- t16_MUX_uxn_opcodes_h_l345_c2_5d29
t16_MUX_uxn_opcodes_h_l345_c2_5d29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l345_c2_5d29_cond,
t16_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue,
t16_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse,
t16_MUX_uxn_opcodes_h_l345_c2_5d29_return_output);

-- printf_uxn_opcodes_h_l346_c3_680b_uxn_opcodes_h_l346_c3_680b
printf_uxn_opcodes_h_l346_c3_680b_uxn_opcodes_h_l346_c3_680b : entity work.printf_uxn_opcodes_h_l346_c3_680b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l346_c3_680b_uxn_opcodes_h_l346_c3_680b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e
BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_left,
BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_right,
BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_return_output);

-- n16_MUX_uxn_opcodes_h_l350_c7_e99c
n16_MUX_uxn_opcodes_h_l350_c7_e99c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l350_c7_e99c_cond,
n16_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue,
n16_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse,
n16_MUX_uxn_opcodes_h_l350_c7_e99c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c
result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c
result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c
result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c
result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c
result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_cond,
result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_return_output);

-- t16_MUX_uxn_opcodes_h_l350_c7_e99c
t16_MUX_uxn_opcodes_h_l350_c7_e99c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l350_c7_e99c_cond,
t16_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue,
t16_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse,
t16_MUX_uxn_opcodes_h_l350_c7_e99c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf
BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_left,
BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_right,
BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_return_output);

-- n16_MUX_uxn_opcodes_h_l353_c7_a448
n16_MUX_uxn_opcodes_h_l353_c7_a448 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l353_c7_a448_cond,
n16_MUX_uxn_opcodes_h_l353_c7_a448_iftrue,
n16_MUX_uxn_opcodes_h_l353_c7_a448_iffalse,
n16_MUX_uxn_opcodes_h_l353_c7_a448_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448
result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_cond,
result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_return_output);

-- t16_MUX_uxn_opcodes_h_l353_c7_a448
t16_MUX_uxn_opcodes_h_l353_c7_a448 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l353_c7_a448_cond,
t16_MUX_uxn_opcodes_h_l353_c7_a448_iftrue,
t16_MUX_uxn_opcodes_h_l353_c7_a448_iffalse,
t16_MUX_uxn_opcodes_h_l353_c7_a448_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9
BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_left,
BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_right,
BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_return_output);

-- n16_MUX_uxn_opcodes_h_l358_c7_2ec8
n16_MUX_uxn_opcodes_h_l358_c7_2ec8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l358_c7_2ec8_cond,
n16_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue,
n16_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse,
n16_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8
result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8
result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8
result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_cond,
result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output);

-- t16_MUX_uxn_opcodes_h_l358_c7_2ec8
t16_MUX_uxn_opcodes_h_l358_c7_2ec8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l358_c7_2ec8_cond,
t16_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue,
t16_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse,
t16_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7
BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_left,
BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_right,
BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_return_output);

-- n16_MUX_uxn_opcodes_h_l361_c7_06af
n16_MUX_uxn_opcodes_h_l361_c7_06af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l361_c7_06af_cond,
n16_MUX_uxn_opcodes_h_l361_c7_06af_iftrue,
n16_MUX_uxn_opcodes_h_l361_c7_06af_iffalse,
n16_MUX_uxn_opcodes_h_l361_c7_06af_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af
result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_cond,
result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_return_output);

-- t16_MUX_uxn_opcodes_h_l361_c7_06af
t16_MUX_uxn_opcodes_h_l361_c7_06af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l361_c7_06af_cond,
t16_MUX_uxn_opcodes_h_l361_c7_06af_iftrue,
t16_MUX_uxn_opcodes_h_l361_c7_06af_iffalse,
t16_MUX_uxn_opcodes_h_l361_c7_06af_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04
BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_left,
BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_right,
BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0
BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_left,
BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_right,
BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_return_output);

-- n16_MUX_uxn_opcodes_h_l365_c7_08fc
n16_MUX_uxn_opcodes_h_l365_c7_08fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l365_c7_08fc_cond,
n16_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue,
n16_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse,
n16_MUX_uxn_opcodes_h_l365_c7_08fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc
result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc
result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc
result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc
result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_cond,
result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e
BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_left,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_right,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_return_output);

-- n16_MUX_uxn_opcodes_h_l368_c7_39e9
n16_MUX_uxn_opcodes_h_l368_c7_39e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l368_c7_39e9_cond,
n16_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue,
n16_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse,
n16_MUX_uxn_opcodes_h_l368_c7_39e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9
result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_cond,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2
BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_left,
BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_right,
BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_return_output);

-- n16_MUX_uxn_opcodes_h_l373_c7_6de0
n16_MUX_uxn_opcodes_h_l373_c7_6de0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l373_c7_6de0_cond,
n16_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue,
n16_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse,
n16_MUX_uxn_opcodes_h_l373_c7_6de0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0
result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_cond,
result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6
BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_return_output);

-- n16_MUX_uxn_opcodes_h_l376_c7_a727
n16_MUX_uxn_opcodes_h_l376_c7_a727 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l376_c7_a727_cond,
n16_MUX_uxn_opcodes_h_l376_c7_a727_iftrue,
n16_MUX_uxn_opcodes_h_l376_c7_a727_iffalse,
n16_MUX_uxn_opcodes_h_l376_c7_a727_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727
result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b
BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_left,
BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_right,
BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l379_c30_b75e
sp_relative_shift_uxn_opcodes_h_l379_c30_b75e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_ins,
sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_x,
sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_y,
sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c
BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35
result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_cond,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038
BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_left,
BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_right,
BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3
result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3
result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_cond,
result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5
BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_left,
BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_right,
BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0
result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_cond,
result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_return_output);

-- CONST_SR_8_uxn_opcodes_h_l395_c31_9121
CONST_SR_8_uxn_opcodes_h_l395_c31_9121 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l395_c31_9121_x,
CONST_SR_8_uxn_opcodes_h_l395_c31_9121_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3
BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_left,
BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_right,
BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be
result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be
result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be
result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_cond,
result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3
BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_left,
BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_right,
BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4
result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4
result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4
result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_cond,
result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7
BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_left,
BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_right,
BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c
CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_67aa
CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_67aa : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_67aa_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_67aa_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_return_output,
 n16_MUX_uxn_opcodes_h_l345_c2_5d29_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_return_output,
 t16_MUX_uxn_opcodes_h_l345_c2_5d29_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_return_output,
 n16_MUX_uxn_opcodes_h_l350_c7_e99c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_return_output,
 t16_MUX_uxn_opcodes_h_l350_c7_e99c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_return_output,
 n16_MUX_uxn_opcodes_h_l353_c7_a448_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_return_output,
 t16_MUX_uxn_opcodes_h_l353_c7_a448_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_return_output,
 n16_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output,
 t16_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_return_output,
 n16_MUX_uxn_opcodes_h_l361_c7_06af_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_return_output,
 t16_MUX_uxn_opcodes_h_l361_c7_06af_return_output,
 BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_return_output,
 n16_MUX_uxn_opcodes_h_l365_c7_08fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_return_output,
 n16_MUX_uxn_opcodes_h_l368_c7_39e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_return_output,
 n16_MUX_uxn_opcodes_h_l373_c7_6de0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_return_output,
 n16_MUX_uxn_opcodes_h_l376_c7_a727_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_return_output,
 BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_return_output,
 sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_return_output,
 CONST_SR_8_uxn_opcodes_h_l395_c31_9121_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_67aa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l350_c7_e99c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c2_5d29_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c2_5d29_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l347_c3_0d32 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l350_c7_e99c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l345_c2_5d29_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l345_c2_5d29_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l346_c3_680b_uxn_opcodes_h_l346_c3_680b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_a448_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l350_c7_e99c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l351_c3_3c75 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_a448_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l350_c7_e99c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_a448_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_a448_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_a448_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l356_c3_9f40 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_a448_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_a448_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_a448_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_06af_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l358_c7_2ec8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_7928 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_06af_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l358_c7_2ec8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_06af_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_06af_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l365_c7_08fc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_06af_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_3fa5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_06af_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_06af_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_06af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_39e9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l365_c7_08fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_a8a9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l373_c7_6de0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_39e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_ed4b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_a727_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l373_c7_6de0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_e3b7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_a727_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_a727_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_a727_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_e297 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l382_c21_0d08_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l386_c3_a26b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_ab01 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l391_c21_d515_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l394_c3_c0d3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l395_c31_9121_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l395_c31_9121_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l395_c21_6b2a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l398_c3_8102 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l399_c21_dadd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l402_c3_53ee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l401_c7_6ea4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l373_l350_l365_l368_l376_l345_l353_l358_l361_DUPLICATE_c931_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l373_l350_l365_l384_l368_l345_l353_l358_l361_DUPLICATE_05fa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l373_l397_l350_l365_l401_l405_l384_l368_l345_l353_l358_l393_l389_l361_DUPLICATE_252d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l373_l350_l365_l401_l368_l345_l353_l358_l361_DUPLICATE_1ec5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l373_l397_l365_l350_l401_l405_l384_l368_l376_l353_l358_l393_l389_l361_DUPLICATE_5ba0_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l354_l362_l369_l377_DUPLICATE_0448_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_67aa_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_67aa_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_4c68_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l410_l341_DUPLICATE_6477_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l398_c3_8102 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l398_c3_8102;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l386_c3_a26b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l386_c3_a26b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_ab01 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_ab01;
     VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_7928 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_7928;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_ed4b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_ed4b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_right := to_unsigned(10, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_right := to_unsigned(14, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l347_c3_0d32 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l347_c3_0d32;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l351_c3_3c75 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l351_c3_3c75;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_3fa5 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_3fa5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l394_c3_c0d3 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l394_c3_c0d3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l356_c3_9f40 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l356_c3_9f40;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_a8a9 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_a8a9;
     VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l402_c3_53ee := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l402_c3_53ee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_e297 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_e297;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_e3b7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_e3b7;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_67aa_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_a448_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_06af_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_a727_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l395_c31_9121_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_06af_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l393_c11_80c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l368_c11_cb6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l397_c11_d6c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_4fb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_67aa LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_67aa_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_67aa_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_67aa_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_67aa_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l373_l350_l365_l384_l368_l345_l353_l358_l361_DUPLICATE_05fa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l373_l350_l365_l384_l368_l345_l353_l358_l361_DUPLICATE_05fa_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l358_c11_d3e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l389_c11_8038] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_left;
     BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_return_output := BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l354_l362_l369_l377_DUPLICATE_0448 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l354_l362_l369_l377_DUPLICATE_0448_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_406c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l350_c11_545e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_left;
     BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_return_output := BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l373_c11_84a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l353_c11_eedf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_left;
     BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_return_output := BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l373_l350_l365_l368_l376_l345_l353_l358_l361_DUPLICATE_c931 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l373_l350_l365_l368_l376_l345_l353_l358_l361_DUPLICATE_c931_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l345_c6_e429] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_left;
     BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_return_output := BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l373_l397_l365_l350_l401_l405_l384_l368_l376_l353_l358_l393_l389_l361_DUPLICATE_5ba0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l373_l397_l365_l350_l401_l405_l384_l368_l376_l353_l358_l393_l389_l361_DUPLICATE_5ba0_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l405_c11_cef7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_left;
     BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_return_output := BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l373_l350_l365_l401_l368_l345_l353_l358_l361_DUPLICATE_1ec5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l373_l350_l365_l401_l368_l345_l353_l358_l361_DUPLICATE_1ec5_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l401_c11_02e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l395_c31_9121] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l395_c31_9121_x <= VAR_CONST_SR_8_uxn_opcodes_h_l395_c31_9121_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l395_c31_9121_return_output := CONST_SR_8_uxn_opcodes_h_l395_c31_9121_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l373_l397_l350_l365_l401_l405_l384_l368_l345_l353_l358_l393_l389_l361_DUPLICATE_252d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l373_l397_l350_l365_l401_l405_l384_l368_l345_l353_l358_l393_l389_l361_DUPLICATE_252d_return_output := result.is_stack_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l401_c7_6ea4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l401_c7_6ea4_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l399_c21_dadd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l399_c21_dadd_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l391_c21_d515] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l391_c21_d515_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l365_c11_ebb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l361_c11_71e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l379_c30_b75e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_ins;
     sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_x;
     sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_return_output := sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l345_c2_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l345_c2_5d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_e429_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l350_c7_e99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l350_c7_e99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_545e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_a448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_a448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_eedf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l358_c7_2ec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l358_c7_2ec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_d3e9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_06af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_06af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_71e7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l365_c7_08fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ebb0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_39e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cb6e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l373_c7_6de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_84a2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_a727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_4fb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_406c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_8038_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_80c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_d6c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_02e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_cef7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l354_l362_l369_l377_DUPLICATE_0448_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l354_l362_l369_l377_DUPLICATE_0448_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l354_l362_l369_l377_DUPLICATE_0448_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l391_c21_d515_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l399_c21_dadd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l373_l350_l365_l368_l376_l345_l353_l358_l361_DUPLICATE_c931_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l373_l350_l365_l368_l376_l345_l353_l358_l361_DUPLICATE_c931_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l373_l350_l365_l368_l376_l345_l353_l358_l361_DUPLICATE_c931_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l373_l350_l365_l368_l376_l345_l353_l358_l361_DUPLICATE_c931_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l373_l350_l365_l368_l376_l345_l353_l358_l361_DUPLICATE_c931_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l373_l350_l365_l368_l376_l345_l353_l358_l361_DUPLICATE_c931_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l373_l350_l365_l368_l376_l345_l353_l358_l361_DUPLICATE_c931_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l373_l350_l365_l368_l376_l345_l353_l358_l361_DUPLICATE_c931_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l373_l350_l365_l368_l376_l345_l353_l358_l361_DUPLICATE_c931_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l373_l397_l365_l350_l401_l405_l384_l368_l376_l353_l358_l393_l389_l361_DUPLICATE_5ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l373_l397_l365_l350_l401_l405_l384_l368_l376_l353_l358_l393_l389_l361_DUPLICATE_5ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l373_l397_l365_l350_l401_l405_l384_l368_l376_l353_l358_l393_l389_l361_DUPLICATE_5ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l373_l397_l365_l350_l401_l405_l384_l368_l376_l353_l358_l393_l389_l361_DUPLICATE_5ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l373_l397_l365_l350_l401_l405_l384_l368_l376_l353_l358_l393_l389_l361_DUPLICATE_5ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l373_l397_l365_l350_l401_l405_l384_l368_l376_l353_l358_l393_l389_l361_DUPLICATE_5ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l373_l397_l365_l350_l401_l405_l384_l368_l376_l353_l358_l393_l389_l361_DUPLICATE_5ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l373_l397_l365_l350_l401_l405_l384_l368_l376_l353_l358_l393_l389_l361_DUPLICATE_5ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l373_l397_l365_l350_l401_l405_l384_l368_l376_l353_l358_l393_l389_l361_DUPLICATE_5ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l373_l397_l365_l350_l401_l405_l384_l368_l376_l353_l358_l393_l389_l361_DUPLICATE_5ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l373_l397_l365_l350_l401_l405_l384_l368_l376_l353_l358_l393_l389_l361_DUPLICATE_5ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l373_l397_l365_l350_l401_l405_l384_l368_l376_l353_l358_l393_l389_l361_DUPLICATE_5ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l373_l397_l365_l350_l401_l405_l384_l368_l376_l353_l358_l393_l389_l361_DUPLICATE_5ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l373_l397_l365_l350_l401_l405_l384_l368_l376_l353_l358_l393_l389_l361_DUPLICATE_5ba0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l373_l350_l365_l384_l368_l345_l353_l358_l361_DUPLICATE_05fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l373_l350_l365_l384_l368_l345_l353_l358_l361_DUPLICATE_05fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l373_l350_l365_l384_l368_l345_l353_l358_l361_DUPLICATE_05fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l373_l350_l365_l384_l368_l345_l353_l358_l361_DUPLICATE_05fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l373_l350_l365_l384_l368_l345_l353_l358_l361_DUPLICATE_05fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l373_l350_l365_l384_l368_l345_l353_l358_l361_DUPLICATE_05fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l373_l350_l365_l384_l368_l345_l353_l358_l361_DUPLICATE_05fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l373_l350_l365_l384_l368_l345_l353_l358_l361_DUPLICATE_05fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l373_l350_l365_l384_l368_l345_l353_l358_l361_DUPLICATE_05fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l373_l397_l350_l365_l401_l405_l384_l368_l345_l353_l358_l393_l389_l361_DUPLICATE_252d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l373_l397_l350_l365_l401_l405_l384_l368_l345_l353_l358_l393_l389_l361_DUPLICATE_252d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l373_l397_l350_l365_l401_l405_l384_l368_l345_l353_l358_l393_l389_l361_DUPLICATE_252d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l373_l397_l350_l365_l401_l405_l384_l368_l345_l353_l358_l393_l389_l361_DUPLICATE_252d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l373_l397_l350_l365_l401_l405_l384_l368_l345_l353_l358_l393_l389_l361_DUPLICATE_252d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l373_l397_l350_l365_l401_l405_l384_l368_l345_l353_l358_l393_l389_l361_DUPLICATE_252d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l373_l397_l350_l365_l401_l405_l384_l368_l345_l353_l358_l393_l389_l361_DUPLICATE_252d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l373_l397_l350_l365_l401_l405_l384_l368_l345_l353_l358_l393_l389_l361_DUPLICATE_252d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l373_l397_l350_l365_l401_l405_l384_l368_l345_l353_l358_l393_l389_l361_DUPLICATE_252d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l373_l397_l350_l365_l401_l405_l384_l368_l345_l353_l358_l393_l389_l361_DUPLICATE_252d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l373_l397_l350_l365_l401_l405_l384_l368_l345_l353_l358_l393_l389_l361_DUPLICATE_252d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l373_l397_l350_l365_l401_l405_l384_l368_l345_l353_l358_l393_l389_l361_DUPLICATE_252d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l373_l397_l350_l365_l401_l405_l384_l368_l345_l353_l358_l393_l389_l361_DUPLICATE_252d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l373_l397_l350_l365_l401_l405_l384_l368_l345_l353_l358_l393_l389_l361_DUPLICATE_252d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l373_l350_l365_l401_l368_l345_l353_l358_l361_DUPLICATE_1ec5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l373_l350_l365_l401_l368_l345_l353_l358_l361_DUPLICATE_1ec5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l373_l350_l365_l401_l368_l345_l353_l358_l361_DUPLICATE_1ec5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l373_l350_l365_l401_l368_l345_l353_l358_l361_DUPLICATE_1ec5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l373_l350_l365_l401_l368_l345_l353_l358_l361_DUPLICATE_1ec5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l373_l350_l365_l401_l368_l345_l353_l358_l361_DUPLICATE_1ec5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l373_l350_l365_l401_l368_l345_l353_l358_l361_DUPLICATE_1ec5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l373_l350_l365_l401_l368_l345_l353_l358_l361_DUPLICATE_1ec5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l373_l350_l365_l401_l368_l345_l353_l358_l361_DUPLICATE_1ec5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l401_c7_6ea4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_b75e_return_output;
     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_4c68 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_4c68_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_67aa_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l395_c21_6b2a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l395_c21_6b2a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l395_c31_9121_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l376_c7_a727] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l345_c1_9b23] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l401_c7_6ea4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l362_c3_3d04] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_left;
     BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_return_output := BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l377_c3_d91b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_left;
     BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_return_output := BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l405_c7_47b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l384_c7_5f35] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l405_c7_47b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_06af_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_3d04_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_a727_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l395_c21_6b2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_4c68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_4c68_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_a448_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_113c_return_output;
     VAR_printf_uxn_opcodes_h_l346_c3_680b_uxn_opcodes_h_l346_c3_680b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_9b23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_47b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_5f35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_47b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_a727_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l401_c7_6ea4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l401_c7_6ea4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l376_c7_a727] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_return_output;

     -- printf_uxn_opcodes_h_l346_c3_680b[uxn_opcodes_h_l346_c3_680b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l346_c3_680b_uxn_opcodes_h_l346_c3_680b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l346_c3_680b_uxn_opcodes_h_l346_c3_680b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l361_c7_06af] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l361_c7_06af_cond <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_06af_cond;
     t16_MUX_uxn_opcodes_h_l361_c7_06af_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_06af_iftrue;
     t16_MUX_uxn_opcodes_h_l361_c7_06af_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_06af_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_06af_return_output := t16_MUX_uxn_opcodes_h_l361_c7_06af_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l397_c7_58be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l382_c21_0d08] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l382_c21_0d08_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_d91b_return_output);

     -- result_u8_value_MUX[uxn_opcodes_h_l401_c7_6ea4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output := result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output;

     -- n16_MUX[uxn_opcodes_h_l376_c7_a727] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l376_c7_a727_cond <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_a727_cond;
     n16_MUX_uxn_opcodes_h_l376_c7_a727_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_a727_iftrue;
     n16_MUX_uxn_opcodes_h_l376_c7_a727_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_a727_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_a727_return_output := n16_MUX_uxn_opcodes_h_l376_c7_a727_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l373_c7_6de0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l382_c21_0d08_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l376_c7_a727_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_a727_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_6de0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_58be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_6ea4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l361_c7_06af_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l368_c7_39e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l397_c7_58be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l393_c7_77f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_return_output;

     -- n16_MUX[uxn_opcodes_h_l373_c7_6de0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l373_c7_6de0_cond <= VAR_n16_MUX_uxn_opcodes_h_l373_c7_6de0_cond;
     n16_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue;
     n16_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l373_c7_6de0_return_output := n16_MUX_uxn_opcodes_h_l373_c7_6de0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l397_c7_58be] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l397_c7_58be] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_cond;
     result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_return_output := result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l373_c7_6de0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_return_output;

     -- t16_MUX[uxn_opcodes_h_l358_c7_2ec8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l358_c7_2ec8_cond <= VAR_t16_MUX_uxn_opcodes_h_l358_c7_2ec8_cond;
     t16_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue;
     t16_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output := t16_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l373_c7_6de0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_58be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_6de0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_58be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_39e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_77f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_58be_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_a448_iffalse := VAR_t16_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l368_c7_39e9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_return_output;

     -- t16_MUX[uxn_opcodes_h_l353_c7_a448] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l353_c7_a448_cond <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_a448_cond;
     t16_MUX_uxn_opcodes_h_l353_c7_a448_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_a448_iftrue;
     t16_MUX_uxn_opcodes_h_l353_c7_a448_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_a448_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_a448_return_output := t16_MUX_uxn_opcodes_h_l353_c7_a448_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l393_c7_77f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l389_c7_fcb3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output;

     -- n16_MUX[uxn_opcodes_h_l368_c7_39e9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l368_c7_39e9_cond <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_39e9_cond;
     n16_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue;
     n16_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_39e9_return_output := n16_MUX_uxn_opcodes_h_l368_c7_39e9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l393_c7_77f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l365_c7_08fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l393_c7_77f0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_return_output := result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l368_c7_39e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_77f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_39e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_77f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_08fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_77f0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l353_c7_a448_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l389_c7_fcb3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output;

     -- n16_MUX[uxn_opcodes_h_l365_c7_08fc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l365_c7_08fc_cond <= VAR_n16_MUX_uxn_opcodes_h_l365_c7_08fc_cond;
     n16_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue;
     n16_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l365_c7_08fc_return_output := n16_MUX_uxn_opcodes_h_l365_c7_08fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_5f35] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l389_c7_fcb3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l361_c7_06af] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_return_output;

     -- t16_MUX[uxn_opcodes_h_l350_c7_e99c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l350_c7_e99c_cond <= VAR_t16_MUX_uxn_opcodes_h_l350_c7_e99c_cond;
     t16_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue;
     t16_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l350_c7_e99c_return_output := t16_MUX_uxn_opcodes_h_l350_c7_e99c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l389_c7_fcb3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output := result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l365_c7_08fc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_06af_iffalse := VAR_n16_MUX_uxn_opcodes_h_l365_c7_08fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_08fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_06af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_5f35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_fcb3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse := VAR_t16_MUX_uxn_opcodes_h_l350_c7_e99c_return_output;
     -- n16_MUX[uxn_opcodes_h_l361_c7_06af] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l361_c7_06af_cond <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_06af_cond;
     n16_MUX_uxn_opcodes_h_l361_c7_06af_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_06af_iftrue;
     n16_MUX_uxn_opcodes_h_l361_c7_06af_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_06af_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_06af_return_output := n16_MUX_uxn_opcodes_h_l361_c7_06af_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l358_c7_2ec8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output;

     -- t16_MUX[uxn_opcodes_h_l345_c2_5d29] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l345_c2_5d29_cond <= VAR_t16_MUX_uxn_opcodes_h_l345_c2_5d29_cond;
     t16_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue;
     t16_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l345_c2_5d29_return_output := t16_MUX_uxn_opcodes_h_l345_c2_5d29_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l384_c7_5f35] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_cond;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_return_output := result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_a727] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_5f35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l361_c7_06af] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l384_c7_5f35] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l361_c7_06af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_5f35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_06af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_5f35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_a727_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_5f35_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l345_c2_5d29_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_a727] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l358_c7_2ec8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output;

     -- n16_MUX[uxn_opcodes_h_l358_c7_2ec8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l358_c7_2ec8_cond <= VAR_n16_MUX_uxn_opcodes_h_l358_c7_2ec8_cond;
     n16_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue;
     n16_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output := n16_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_a727] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l353_c7_a448] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l373_c7_6de0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l376_c7_a727] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_a448_iffalse := VAR_n16_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_a727_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_a727_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_a448_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_6de0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_a727_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l350_c7_e99c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_return_output;

     -- n16_MUX[uxn_opcodes_h_l353_c7_a448] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l353_c7_a448_cond <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_a448_cond;
     n16_MUX_uxn_opcodes_h_l353_c7_a448_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_a448_iftrue;
     n16_MUX_uxn_opcodes_h_l353_c7_a448_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_a448_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_a448_return_output := n16_MUX_uxn_opcodes_h_l353_c7_a448_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l353_c7_a448] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l373_c7_6de0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l373_c7_6de0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l373_c7_6de0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_return_output := result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_39e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l353_c7_a448_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_6de0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_a448_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_6de0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_e99c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_39e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_6de0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_39e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l350_c7_e99c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_return_output;

     -- n16_MUX[uxn_opcodes_h_l350_c7_e99c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l350_c7_e99c_cond <= VAR_n16_MUX_uxn_opcodes_h_l350_c7_e99c_cond;
     n16_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue;
     n16_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l350_c7_e99c_return_output := n16_MUX_uxn_opcodes_h_l350_c7_e99c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l368_c7_39e9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_return_output := result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_39e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l365_c7_08fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l345_c2_5d29] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse := VAR_n16_MUX_uxn_opcodes_h_l350_c7_e99c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_39e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_e99c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_39e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_08fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_39e9_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l361_c7_06af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_return_output;

     -- n16_MUX[uxn_opcodes_h_l345_c2_5d29] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l345_c2_5d29_cond <= VAR_n16_MUX_uxn_opcodes_h_l345_c2_5d29_cond;
     n16_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue;
     n16_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l345_c2_5d29_return_output := n16_MUX_uxn_opcodes_h_l345_c2_5d29_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l365_c7_08fc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_return_output := result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l345_c2_5d29] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l365_c7_08fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l365_c7_08fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l345_c2_5d29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_08fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_08fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_06af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_08fc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l358_c7_2ec8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l361_c7_06af] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_cond;
     result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_return_output := result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l361_c7_06af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l361_c7_06af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_06af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_06af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_06af_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l353_c7_a448] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l358_c7_2ec8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l358_c7_2ec8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output := result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l358_c7_2ec8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_a448_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_2ec8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l353_c7_a448] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l353_c7_a448] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l353_c7_a448] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_cond;
     result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_return_output := result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l350_c7_e99c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_a448_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_a448_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_e99c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_a448_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l350_c7_e99c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l345_c2_5d29] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l350_c7_e99c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_return_output := result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l350_c7_e99c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_e99c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_e99c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_e99c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l345_c2_5d29] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_cond;
     result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_return_output := result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l345_c2_5d29] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l345_c2_5d29] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_return_output;

     -- Submodule level 16
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l410_l341_DUPLICATE_6477 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l410_l341_DUPLICATE_6477_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_5d29_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_5d29_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_5d29_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_5d29_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_5d29_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_5d29_return_output);

     -- Submodule level 17
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l410_l341_DUPLICATE_6477_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l410_l341_DUPLICATE_6477_return_output;
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
