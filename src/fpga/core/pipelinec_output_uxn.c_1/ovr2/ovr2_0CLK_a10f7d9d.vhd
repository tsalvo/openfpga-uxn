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
-- BIN_OP_EQ[uxn_opcodes_h_l345_c6_32e8]
signal BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l345_c1_c77a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l345_c2_065c]
signal n16_MUX_uxn_opcodes_h_l345_c2_065c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c2_065c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c2_065c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c2_065c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l345_c2_065c]
signal result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l345_c2_065c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l345_c2_065c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l345_c2_065c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l345_c2_065c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l345_c2_065c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l345_c2_065c]
signal t16_MUX_uxn_opcodes_h_l345_c2_065c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l345_c2_065c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l345_c2_065c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l345_c2_065c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l346_c3_7c60[uxn_opcodes_h_l346_c3_7c60]
signal printf_uxn_opcodes_h_l346_c3_7c60_uxn_opcodes_h_l346_c3_7c60_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l350_c11_27d5]
signal BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l350_c7_3bea]
signal n16_MUX_uxn_opcodes_h_l350_c7_3bea_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l350_c7_3bea_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l350_c7_3bea]
signal result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l350_c7_3bea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l350_c7_3bea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l350_c7_3bea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l350_c7_3bea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l350_c7_3bea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l350_c7_3bea]
signal t16_MUX_uxn_opcodes_h_l350_c7_3bea_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l350_c7_3bea_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l353_c11_825d]
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l353_c7_5aa8]
signal n16_MUX_uxn_opcodes_h_l353_c7_5aa8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l353_c7_5aa8]
signal result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l353_c7_5aa8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l353_c7_5aa8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l353_c7_5aa8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l353_c7_5aa8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l353_c7_5aa8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l353_c7_5aa8]
signal t16_MUX_uxn_opcodes_h_l353_c7_5aa8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l358_c11_fb89]
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l358_c7_82f4]
signal n16_MUX_uxn_opcodes_h_l358_c7_82f4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l358_c7_82f4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l358_c7_82f4]
signal result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l358_c7_82f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l358_c7_82f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l358_c7_82f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l358_c7_82f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l358_c7_82f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l358_c7_82f4]
signal t16_MUX_uxn_opcodes_h_l358_c7_82f4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l358_c7_82f4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l361_c11_980a]
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l361_c7_ae51]
signal n16_MUX_uxn_opcodes_h_l361_c7_ae51_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_ae51_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l361_c7_ae51]
signal result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l361_c7_ae51]
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l361_c7_ae51]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l361_c7_ae51]
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l361_c7_ae51]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l361_c7_ae51]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l361_c7_ae51]
signal t16_MUX_uxn_opcodes_h_l361_c7_ae51_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_ae51_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l362_c3_10a0]
signal BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l365_c11_ed02]
signal BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l365_c7_d113]
signal n16_MUX_uxn_opcodes_h_l365_c7_d113_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l365_c7_d113_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l365_c7_d113_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l365_c7_d113_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l365_c7_d113]
signal result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l365_c7_d113]
signal result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l365_c7_d113]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l365_c7_d113]
signal result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l365_c7_d113]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l365_c7_d113]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l368_c11_9d47]
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l368_c7_4776]
signal n16_MUX_uxn_opcodes_h_l368_c7_4776_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_4776_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_4776_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_4776_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l368_c7_4776]
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_4776]
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l368_c7_4776]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_4776]
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l368_c7_4776]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_4776]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l373_c11_0747]
signal BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l373_c7_0389]
signal n16_MUX_uxn_opcodes_h_l373_c7_0389_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l373_c7_0389_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l373_c7_0389_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l373_c7_0389_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l373_c7_0389]
signal result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l373_c7_0389]
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l373_c7_0389]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l373_c7_0389]
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l373_c7_0389]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l373_c7_0389]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_d2d8]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l376_c7_1d91]
signal n16_MUX_uxn_opcodes_h_l376_c7_1d91_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_1d91_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_1d91]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_1d91]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l376_c7_1d91]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l376_c7_1d91]
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l376_c7_1d91]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_1d91]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l377_c3_ec1f]
signal BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l379_c30_7348]
signal sp_relative_shift_uxn_opcodes_h_l379_c30_7348_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l379_c30_7348_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l379_c30_7348_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l379_c30_7348_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_5e03]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l384_c7_c90c]
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_c90c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l384_c7_c90c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l384_c7_c90c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_c90c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l389_c11_46c6]
signal BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l389_c7_2016]
signal result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l389_c7_2016]
signal result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l389_c7_2016]
signal result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l389_c7_2016]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l393_c11_fafd]
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l393_c7_6fe9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l393_c7_6fe9]
signal result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l393_c7_6fe9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l393_c7_6fe9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l395_c31_c567]
signal CONST_SR_8_uxn_opcodes_h_l395_c31_c567_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l395_c31_c567_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l397_c11_76cd]
signal BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l397_c7_e1b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l397_c7_e1b1]
signal result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l397_c7_e1b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l397_c7_e1b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l401_c11_c5f5]
signal BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l401_c7_2d9a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l401_c7_2d9a]
signal result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l401_c7_2d9a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l401_c7_2d9a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l405_c11_4d55]
signal BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l405_c7_82b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l405_c7_82b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_ae80
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_ae80_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_ae80_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_25e8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8
BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_left,
BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_right,
BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_return_output);

-- n16_MUX_uxn_opcodes_h_l345_c2_065c
n16_MUX_uxn_opcodes_h_l345_c2_065c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l345_c2_065c_cond,
n16_MUX_uxn_opcodes_h_l345_c2_065c_iftrue,
n16_MUX_uxn_opcodes_h_l345_c2_065c_iffalse,
n16_MUX_uxn_opcodes_h_l345_c2_065c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c
result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_cond,
result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c
result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c
result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_return_output);

-- t16_MUX_uxn_opcodes_h_l345_c2_065c
t16_MUX_uxn_opcodes_h_l345_c2_065c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l345_c2_065c_cond,
t16_MUX_uxn_opcodes_h_l345_c2_065c_iftrue,
t16_MUX_uxn_opcodes_h_l345_c2_065c_iffalse,
t16_MUX_uxn_opcodes_h_l345_c2_065c_return_output);

-- printf_uxn_opcodes_h_l346_c3_7c60_uxn_opcodes_h_l346_c3_7c60
printf_uxn_opcodes_h_l346_c3_7c60_uxn_opcodes_h_l346_c3_7c60 : entity work.printf_uxn_opcodes_h_l346_c3_7c60_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l346_c3_7c60_uxn_opcodes_h_l346_c3_7c60_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5
BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_left,
BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_right,
BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_return_output);

-- n16_MUX_uxn_opcodes_h_l350_c7_3bea
n16_MUX_uxn_opcodes_h_l350_c7_3bea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l350_c7_3bea_cond,
n16_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue,
n16_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse,
n16_MUX_uxn_opcodes_h_l350_c7_3bea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea
result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_cond,
result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea
result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea
result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea
result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea
result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_return_output);

-- t16_MUX_uxn_opcodes_h_l350_c7_3bea
t16_MUX_uxn_opcodes_h_l350_c7_3bea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l350_c7_3bea_cond,
t16_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue,
t16_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse,
t16_MUX_uxn_opcodes_h_l350_c7_3bea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d
BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_left,
BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_right,
BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_return_output);

-- n16_MUX_uxn_opcodes_h_l353_c7_5aa8
n16_MUX_uxn_opcodes_h_l353_c7_5aa8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l353_c7_5aa8_cond,
n16_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue,
n16_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse,
n16_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8
result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_cond,
result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output);

-- t16_MUX_uxn_opcodes_h_l353_c7_5aa8
t16_MUX_uxn_opcodes_h_l353_c7_5aa8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l353_c7_5aa8_cond,
t16_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue,
t16_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse,
t16_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89
BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_left,
BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_right,
BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_return_output);

-- n16_MUX_uxn_opcodes_h_l358_c7_82f4
n16_MUX_uxn_opcodes_h_l358_c7_82f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l358_c7_82f4_cond,
n16_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue,
n16_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse,
n16_MUX_uxn_opcodes_h_l358_c7_82f4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4
result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4
result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_return_output);

-- t16_MUX_uxn_opcodes_h_l358_c7_82f4
t16_MUX_uxn_opcodes_h_l358_c7_82f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l358_c7_82f4_cond,
t16_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue,
t16_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse,
t16_MUX_uxn_opcodes_h_l358_c7_82f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a
BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_left,
BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_right,
BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_return_output);

-- n16_MUX_uxn_opcodes_h_l361_c7_ae51
n16_MUX_uxn_opcodes_h_l361_c7_ae51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l361_c7_ae51_cond,
n16_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue,
n16_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse,
n16_MUX_uxn_opcodes_h_l361_c7_ae51_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51
result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_cond,
result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_return_output);

-- t16_MUX_uxn_opcodes_h_l361_c7_ae51
t16_MUX_uxn_opcodes_h_l361_c7_ae51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l361_c7_ae51_cond,
t16_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue,
t16_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse,
t16_MUX_uxn_opcodes_h_l361_c7_ae51_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0
BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_left,
BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_right,
BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02
BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_left,
BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_right,
BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_return_output);

-- n16_MUX_uxn_opcodes_h_l365_c7_d113
n16_MUX_uxn_opcodes_h_l365_c7_d113 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l365_c7_d113_cond,
n16_MUX_uxn_opcodes_h_l365_c7_d113_iftrue,
n16_MUX_uxn_opcodes_h_l365_c7_d113_iffalse,
n16_MUX_uxn_opcodes_h_l365_c7_d113_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113
result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_cond,
result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113
result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113
result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113
result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113
result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47
BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_left,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_right,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_return_output);

-- n16_MUX_uxn_opcodes_h_l368_c7_4776
n16_MUX_uxn_opcodes_h_l368_c7_4776 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l368_c7_4776_cond,
n16_MUX_uxn_opcodes_h_l368_c7_4776_iftrue,
n16_MUX_uxn_opcodes_h_l368_c7_4776_iffalse,
n16_MUX_uxn_opcodes_h_l368_c7_4776_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776
result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_cond,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747
BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_left,
BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_right,
BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_return_output);

-- n16_MUX_uxn_opcodes_h_l373_c7_0389
n16_MUX_uxn_opcodes_h_l373_c7_0389 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l373_c7_0389_cond,
n16_MUX_uxn_opcodes_h_l373_c7_0389_iftrue,
n16_MUX_uxn_opcodes_h_l373_c7_0389_iffalse,
n16_MUX_uxn_opcodes_h_l373_c7_0389_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389
result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_cond,
result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8
BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_return_output);

-- n16_MUX_uxn_opcodes_h_l376_c7_1d91
n16_MUX_uxn_opcodes_h_l376_c7_1d91 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l376_c7_1d91_cond,
n16_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue,
n16_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse,
n16_MUX_uxn_opcodes_h_l376_c7_1d91_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91
result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f
BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_left,
BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_right,
BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l379_c30_7348
sp_relative_shift_uxn_opcodes_h_l379_c30_7348 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l379_c30_7348_ins,
sp_relative_shift_uxn_opcodes_h_l379_c30_7348_x,
sp_relative_shift_uxn_opcodes_h_l379_c30_7348_y,
sp_relative_shift_uxn_opcodes_h_l379_c30_7348_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03
BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c
result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_cond,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6
BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_left,
BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_right,
BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016
result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016
result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_cond,
result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd
BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_left,
BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_right,
BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9
result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_cond,
result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l395_c31_c567
CONST_SR_8_uxn_opcodes_h_l395_c31_c567 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l395_c31_c567_x,
CONST_SR_8_uxn_opcodes_h_l395_c31_c567_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd
BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_left,
BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_right,
BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1
result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1
result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_cond,
result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1
result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5
BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_left,
BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_right,
BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a
result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a
result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_cond,
result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a
result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55
BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_left,
BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_right,
BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501
CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_ae80
CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_ae80 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_ae80_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_ae80_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_return_output,
 n16_MUX_uxn_opcodes_h_l345_c2_065c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_return_output,
 t16_MUX_uxn_opcodes_h_l345_c2_065c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_return_output,
 n16_MUX_uxn_opcodes_h_l350_c7_3bea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_return_output,
 t16_MUX_uxn_opcodes_h_l350_c7_3bea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_return_output,
 n16_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output,
 t16_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_return_output,
 n16_MUX_uxn_opcodes_h_l358_c7_82f4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_return_output,
 t16_MUX_uxn_opcodes_h_l358_c7_82f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_return_output,
 n16_MUX_uxn_opcodes_h_l361_c7_ae51_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_return_output,
 t16_MUX_uxn_opcodes_h_l361_c7_ae51_return_output,
 BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_return_output,
 n16_MUX_uxn_opcodes_h_l365_c7_d113_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_return_output,
 n16_MUX_uxn_opcodes_h_l368_c7_4776_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_return_output,
 n16_MUX_uxn_opcodes_h_l373_c7_0389_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_return_output,
 n16_MUX_uxn_opcodes_h_l376_c7_1d91_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_return_output,
 BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_return_output,
 sp_relative_shift_uxn_opcodes_h_l379_c30_7348_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output,
 CONST_SR_8_uxn_opcodes_h_l395_c31_c567_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_ae80_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c2_065c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c2_065c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l350_c7_3bea_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c2_065c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c2_065c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l347_c3_91b4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l345_c2_065c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l345_c2_065c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l350_c7_3bea_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l345_c2_065c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l345_c2_065c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l346_c3_7c60_uxn_opcodes_h_l346_c3_7c60_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l350_c7_3bea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l351_c3_4a0b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l350_c7_3bea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l358_c7_82f4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_5aa8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l356_c3_8018 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l358_c7_82f4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_5aa8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_ae51_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l358_c7_82f4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_3318 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_ae51_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l358_c7_82f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l365_c7_d113_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_ae51_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_cb8b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_ae51_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l365_c7_d113_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l365_c7_d113_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_4776_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l365_c7_d113_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_1eeb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_4776_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_4776_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l373_c7_0389_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_4776_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_2f5e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l373_c7_0389_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l373_c7_0389_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_1d91_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l373_c7_0389_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_1816 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_78d9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_7348_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_7348_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_7348_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_7348_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l382_c21_e7d4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l386_c3_97cc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_4f65 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l391_c21_0e19_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l394_c3_3a85 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l395_c31_c567_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l395_c31_c567_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l395_c21_8378_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l398_c3_484f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l399_c21_5e2c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l402_c3_63e4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l401_c7_2d9a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l350_l365_l401_l368_l345_l353_l358_l373_l361_DUPLICATE_451f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l350_l365_l368_l345_l376_l353_l358_l373_l361_DUPLICATE_b70d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l350_l365_l401_l368_l384_l405_l345_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_f60e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l350_l365_l368_l384_l345_l353_l358_l373_l361_DUPLICATE_a85b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l365_l350_l401_l368_l384_l405_l376_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_db40_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l354_l377_l362_l369_DUPLICATE_9eb2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_ae80_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_ae80_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_69b3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l410_l341_DUPLICATE_db72_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_4f65 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_4f65;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l347_c3_91b4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l347_c3_91b4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_1eeb := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_1eeb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_7348_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_cb8b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_cb8b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_right := to_unsigned(13, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_right := to_unsigned(10, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l394_c3_3a85 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l394_c3_3a85;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l402_c3_63e4 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l402_c3_63e4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_right := to_unsigned(11, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_2f5e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_2f5e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l356_c3_8018 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l356_c3_8018;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l351_c3_4a0b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l351_c3_4a0b;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_78d9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_78d9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_1816 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_1816;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_7348_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l386_c3_97cc := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l386_c3_97cc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_3318 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_3318;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l398_c3_484f := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l398_c3_484f;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_7348_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_ae80_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l345_c2_065c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l365_c7_d113_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l373_c7_0389_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l395_c31_c567_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l345_c2_065c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l358_c11_fb89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_left;
     BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_return_output := BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l399_c21_5e2c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l399_c21_5e2c_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l368_c11_9d47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_left;
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_return_output := BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l395_c31_c567] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l395_c31_c567_x <= VAR_CONST_SR_8_uxn_opcodes_h_l395_c31_c567_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l395_c31_c567_return_output := CONST_SR_8_uxn_opcodes_h_l395_c31_c567_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l379_c30_7348] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l379_c30_7348_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_7348_ins;
     sp_relative_shift_uxn_opcodes_h_l379_c30_7348_x <= VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_7348_x;
     sp_relative_shift_uxn_opcodes_h_l379_c30_7348_y <= VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_7348_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_7348_return_output := sp_relative_shift_uxn_opcodes_h_l379_c30_7348_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l365_c11_ed02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_left;
     BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_return_output := BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l365_l350_l401_l368_l384_l405_l376_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_db40 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l365_l350_l401_l368_l384_l405_l376_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_db40_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l401_c7_2d9a] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l401_c7_2d9a_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l350_l365_l401_l368_l345_l353_l358_l373_l361_DUPLICATE_451f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l350_l365_l401_l368_l345_l353_l358_l373_l361_DUPLICATE_451f_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_d2d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l345_c6_32e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l391_c21_0e19] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l391_c21_0e19_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l397_c11_76cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l350_l365_l401_l368_l384_l405_l345_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_f60e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l350_l365_l401_l368_l384_l405_l345_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_f60e_return_output := result.is_stack_write;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_ae80 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_ae80_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_ae80_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_ae80_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_ae80_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l361_c11_980a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_left;
     BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_return_output := BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l354_l377_l362_l369_DUPLICATE_9eb2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l354_l377_l362_l369_DUPLICATE_9eb2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l405_c11_4d55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_left;
     BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_return_output := BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l350_l365_l368_l345_l376_l353_l358_l373_l361_DUPLICATE_b70d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l350_l365_l368_l345_l376_l353_l358_l373_l361_DUPLICATE_b70d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l389_c11_46c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l350_c11_27d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l353_c11_825d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_left;
     BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_return_output := BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l350_l365_l368_l384_l345_l353_l358_l373_l361_DUPLICATE_a85b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l350_l365_l368_l384_l345_l353_l358_l373_l361_DUPLICATE_a85b_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l401_c11_c5f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l373_c11_0747] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_left;
     BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_return_output := BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_5e03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l393_c11_fafd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_left;
     BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_return_output := BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l345_c2_065c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l345_c2_065c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c6_32e8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l350_c7_3bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l350_c7_3bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_27d5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_5aa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_5aa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_825d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l358_c7_82f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l358_c7_82f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_fb89_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_ae51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_ae51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_980a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l365_c7_d113_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l365_c11_ed02_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_4776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_9d47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l373_c7_0389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_0747_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d2d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_5e03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_46c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_fafd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l397_c11_76cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l401_c11_c5f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_4d55_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l354_l377_l362_l369_DUPLICATE_9eb2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l354_l377_l362_l369_DUPLICATE_9eb2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l354_l377_l362_l369_DUPLICATE_9eb2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l391_c21_0e19_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l399_c21_5e2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l350_l365_l368_l345_l376_l353_l358_l373_l361_DUPLICATE_b70d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l350_l365_l368_l345_l376_l353_l358_l373_l361_DUPLICATE_b70d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l350_l365_l368_l345_l376_l353_l358_l373_l361_DUPLICATE_b70d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l350_l365_l368_l345_l376_l353_l358_l373_l361_DUPLICATE_b70d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l350_l365_l368_l345_l376_l353_l358_l373_l361_DUPLICATE_b70d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l350_l365_l368_l345_l376_l353_l358_l373_l361_DUPLICATE_b70d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l350_l365_l368_l345_l376_l353_l358_l373_l361_DUPLICATE_b70d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l350_l365_l368_l345_l376_l353_l358_l373_l361_DUPLICATE_b70d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l350_l365_l368_l345_l376_l353_l358_l373_l361_DUPLICATE_b70d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l365_l350_l401_l368_l384_l405_l376_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_db40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l365_l350_l401_l368_l384_l405_l376_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_db40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l365_l350_l401_l368_l384_l405_l376_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_db40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l365_l350_l401_l368_l384_l405_l376_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_db40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l365_l350_l401_l368_l384_l405_l376_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_db40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l365_l350_l401_l368_l384_l405_l376_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_db40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l365_l350_l401_l368_l384_l405_l376_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_db40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l365_l350_l401_l368_l384_l405_l376_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_db40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l365_l350_l401_l368_l384_l405_l376_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_db40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l365_l350_l401_l368_l384_l405_l376_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_db40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l365_l350_l401_l368_l384_l405_l376_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_db40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l365_l350_l401_l368_l384_l405_l376_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_db40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l365_l350_l401_l368_l384_l405_l376_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_db40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l365_l350_l401_l368_l384_l405_l376_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_db40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l350_l365_l368_l384_l345_l353_l358_l373_l361_DUPLICATE_a85b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l350_l365_l368_l384_l345_l353_l358_l373_l361_DUPLICATE_a85b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l350_l365_l368_l384_l345_l353_l358_l373_l361_DUPLICATE_a85b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l350_l365_l368_l384_l345_l353_l358_l373_l361_DUPLICATE_a85b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l350_l365_l368_l384_l345_l353_l358_l373_l361_DUPLICATE_a85b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l350_l365_l368_l384_l345_l353_l358_l373_l361_DUPLICATE_a85b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l350_l365_l368_l384_l345_l353_l358_l373_l361_DUPLICATE_a85b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l350_l365_l368_l384_l345_l353_l358_l373_l361_DUPLICATE_a85b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l350_l365_l368_l384_l345_l353_l358_l373_l361_DUPLICATE_a85b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l350_l365_l401_l368_l384_l405_l345_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_f60e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l350_l365_l401_l368_l384_l405_l345_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_f60e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l350_l365_l401_l368_l384_l405_l345_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_f60e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l350_l365_l401_l368_l384_l405_l345_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_f60e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l350_l365_l401_l368_l384_l405_l345_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_f60e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l350_l365_l401_l368_l384_l405_l345_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_f60e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l350_l365_l401_l368_l384_l405_l345_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_f60e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l350_l365_l401_l368_l384_l405_l345_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_f60e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l350_l365_l401_l368_l384_l405_l345_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_f60e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l350_l365_l401_l368_l384_l405_l345_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_f60e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l350_l365_l401_l368_l384_l405_l345_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_f60e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l350_l365_l401_l368_l384_l405_l345_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_f60e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l350_l365_l401_l368_l384_l405_l345_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_f60e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l350_l365_l401_l368_l384_l405_l345_l353_l389_l358_l393_l373_l361_l397_DUPLICATE_f60e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l350_l365_l401_l368_l345_l353_l358_l373_l361_DUPLICATE_451f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l350_l365_l401_l368_l345_l353_l358_l373_l361_DUPLICATE_451f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l350_l365_l401_l368_l345_l353_l358_l373_l361_DUPLICATE_451f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l350_l365_l401_l368_l345_l353_l358_l373_l361_DUPLICATE_451f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l350_l365_l401_l368_l345_l353_l358_l373_l361_DUPLICATE_451f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l350_l365_l401_l368_l345_l353_l358_l373_l361_DUPLICATE_451f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l350_l365_l401_l368_l345_l353_l358_l373_l361_DUPLICATE_451f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l350_l365_l401_l368_l345_l353_l358_l373_l361_DUPLICATE_451f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l350_l365_l401_l368_l345_l353_l358_l373_l361_DUPLICATE_451f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l401_c7_2d9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l379_c30_7348_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l401_c7_2d9a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l376_c7_1d91] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l405_c7_82b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l345_c1_c77a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l405_c7_82b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l395_c21_8378] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l395_c21_8378_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l395_c31_c567_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l377_c3_ec1f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_left;
     BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_return_output := BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l384_c7_c90c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_69b3 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_69b3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_ae80_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l362_c3_10a0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_left;
     BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_return_output := BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l362_c3_10a0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l395_c21_8378_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_69b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l403_l387_DUPLICATE_69b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_4776_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l370_l355_DUPLICATE_7501_return_output;
     VAR_printf_uxn_opcodes_h_l346_c3_7c60_uxn_opcodes_h_l346_c3_7c60_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l345_c1_c77a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_82b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_c90c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_82b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1d91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output;
     -- t16_MUX[uxn_opcodes_h_l361_c7_ae51] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l361_c7_ae51_cond <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_ae51_cond;
     t16_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue;
     t16_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_ae51_return_output := t16_MUX_uxn_opcodes_h_l361_c7_ae51_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l382_c21_e7d4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l382_c21_e7d4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l377_c3_ec1f_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l376_c7_1d91] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l397_c7_e1b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l401_c7_2d9a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l373_c7_0389] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_return_output;

     -- printf_uxn_opcodes_h_l346_c3_7c60[uxn_opcodes_h_l346_c3_7c60] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l346_c3_7c60_uxn_opcodes_h_l346_c3_7c60_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l346_c3_7c60_uxn_opcodes_h_l346_c3_7c60_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l376_c7_1d91] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l376_c7_1d91_cond <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_1d91_cond;
     n16_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue;
     n16_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_1d91_return_output := n16_MUX_uxn_opcodes_h_l376_c7_1d91_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l401_c7_2d9a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output := result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l401_c7_2d9a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l382_c21_e7d4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l373_c7_0389_iffalse := VAR_n16_MUX_uxn_opcodes_h_l376_c7_1d91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1d91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_0389_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l401_c7_2d9a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l361_c7_ae51_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l393_c7_6fe9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output;

     -- t16_MUX[uxn_opcodes_h_l358_c7_82f4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l358_c7_82f4_cond <= VAR_t16_MUX_uxn_opcodes_h_l358_c7_82f4_cond;
     t16_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue;
     t16_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l358_c7_82f4_return_output := t16_MUX_uxn_opcodes_h_l358_c7_82f4_return_output;

     -- n16_MUX[uxn_opcodes_h_l373_c7_0389] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l373_c7_0389_cond <= VAR_n16_MUX_uxn_opcodes_h_l373_c7_0389_cond;
     n16_MUX_uxn_opcodes_h_l373_c7_0389_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l373_c7_0389_iftrue;
     n16_MUX_uxn_opcodes_h_l373_c7_0389_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l373_c7_0389_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l373_c7_0389_return_output := n16_MUX_uxn_opcodes_h_l373_c7_0389_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l368_c7_4776] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l397_c7_e1b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l397_c7_e1b1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output := result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l373_c7_0389] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l397_c7_e1b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_4776_iffalse := VAR_n16_MUX_uxn_opcodes_h_l373_c7_0389_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_0389_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_4776_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l397_c7_e1b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l358_c7_82f4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l365_c7_d113] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_return_output;

     -- t16_MUX[uxn_opcodes_h_l353_c7_5aa8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l353_c7_5aa8_cond <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_5aa8_cond;
     t16_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue;
     t16_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output := t16_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l393_c7_6fe9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l393_c7_6fe9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output;

     -- n16_MUX[uxn_opcodes_h_l368_c7_4776] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l368_c7_4776_cond <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_4776_cond;
     n16_MUX_uxn_opcodes_h_l368_c7_4776_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_4776_iftrue;
     n16_MUX_uxn_opcodes_h_l368_c7_4776_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_4776_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_4776_return_output := n16_MUX_uxn_opcodes_h_l368_c7_4776_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l389_c7_2016] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l393_c7_6fe9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output := result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l368_c7_4776] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l365_c7_d113_iffalse := VAR_n16_MUX_uxn_opcodes_h_l368_c7_4776_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_4776_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l365_c7_d113_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_2016_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_6fe9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse := VAR_t16_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l389_c7_2016] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l365_c7_d113] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l389_c7_2016] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_cond;
     result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_return_output := result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l389_c7_2016] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_return_output;

     -- t16_MUX[uxn_opcodes_h_l350_c7_3bea] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l350_c7_3bea_cond <= VAR_t16_MUX_uxn_opcodes_h_l350_c7_3bea_cond;
     t16_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue;
     t16_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l350_c7_3bea_return_output := t16_MUX_uxn_opcodes_h_l350_c7_3bea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_c90c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l361_c7_ae51] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_return_output;

     -- n16_MUX[uxn_opcodes_h_l365_c7_d113] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l365_c7_d113_cond <= VAR_n16_MUX_uxn_opcodes_h_l365_c7_d113_cond;
     n16_MUX_uxn_opcodes_h_l365_c7_d113_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l365_c7_d113_iftrue;
     n16_MUX_uxn_opcodes_h_l365_c7_d113_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l365_c7_d113_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l365_c7_d113_return_output := n16_MUX_uxn_opcodes_h_l365_c7_d113_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse := VAR_n16_MUX_uxn_opcodes_h_l365_c7_d113_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_2016_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l365_c7_d113_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l389_c7_2016_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_ae51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c90c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_2016_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l345_c2_065c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l350_c7_3bea_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_c90c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l358_c7_82f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l384_c7_c90c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_return_output := result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_return_output;

     -- t16_MUX[uxn_opcodes_h_l345_c2_065c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l345_c2_065c_cond <= VAR_t16_MUX_uxn_opcodes_h_l345_c2_065c_cond;
     t16_MUX_uxn_opcodes_h_l345_c2_065c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l345_c2_065c_iftrue;
     t16_MUX_uxn_opcodes_h_l345_c2_065c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l345_c2_065c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l345_c2_065c_return_output := t16_MUX_uxn_opcodes_h_l345_c2_065c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l361_c7_ae51] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_return_output;

     -- n16_MUX[uxn_opcodes_h_l361_c7_ae51] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l361_c7_ae51_cond <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_ae51_cond;
     n16_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue;
     n16_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_ae51_return_output := n16_MUX_uxn_opcodes_h_l361_c7_ae51_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_1d91] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l384_c7_c90c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l361_c7_ae51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c90c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_ae51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_c90c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_82f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1d91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c90c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l345_c2_065c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l376_c7_1d91] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_1d91] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_return_output;

     -- n16_MUX[uxn_opcodes_h_l358_c7_82f4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l358_c7_82f4_cond <= VAR_n16_MUX_uxn_opcodes_h_l358_c7_82f4_cond;
     n16_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue;
     n16_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l358_c7_82f4_return_output := n16_MUX_uxn_opcodes_h_l358_c7_82f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l373_c7_0389] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_1d91] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l358_c7_82f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l353_c7_5aa8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l358_c7_82f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1d91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_82f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1d91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_0389_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_1d91_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l373_c7_0389] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_4776] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l353_c7_5aa8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l373_c7_0389] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_cond;
     result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_return_output := result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l350_c7_3bea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_return_output;

     -- n16_MUX[uxn_opcodes_h_l353_c7_5aa8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l353_c7_5aa8_cond <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_5aa8_cond;
     n16_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue;
     n16_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output := n16_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l373_c7_0389] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse := VAR_n16_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_0389_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_0389_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l350_c7_3bea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_4776_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l373_c7_0389_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l345_c2_065c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_4776] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l365_c7_d113] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l368_c7_4776] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_cond;
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_return_output := result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_return_output;

     -- n16_MUX[uxn_opcodes_h_l350_c7_3bea] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l350_c7_3bea_cond <= VAR_n16_MUX_uxn_opcodes_h_l350_c7_3bea_cond;
     n16_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue;
     n16_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l350_c7_3bea_return_output := n16_MUX_uxn_opcodes_h_l350_c7_3bea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l350_c7_3bea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_4776] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l345_c2_065c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l350_c7_3bea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_4776_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3bea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_4776_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l365_c7_d113_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_4776_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l365_c7_d113] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l345_c2_065c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l365_c7_d113] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l361_c7_ae51] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l365_c7_d113] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_cond;
     result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_return_output := result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_return_output;

     -- n16_MUX[uxn_opcodes_h_l345_c2_065c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l345_c2_065c_cond <= VAR_n16_MUX_uxn_opcodes_h_l345_c2_065c_cond;
     n16_MUX_uxn_opcodes_h_l345_c2_065c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l345_c2_065c_iftrue;
     n16_MUX_uxn_opcodes_h_l345_c2_065c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l345_c2_065c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l345_c2_065c_return_output := n16_MUX_uxn_opcodes_h_l345_c2_065c_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l345_c2_065c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l365_c7_d113_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l365_c7_d113_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_ae51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l365_c7_d113_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l361_c7_ae51] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_cond;
     result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_return_output := result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l358_c7_82f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l361_c7_ae51] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l361_c7_ae51] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_ae51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_ae51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_82f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l361_c7_ae51_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l358_c7_82f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l358_c7_82f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l353_c7_5aa8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l358_c7_82f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_82f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_82f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l358_c7_82f4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l353_c7_5aa8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output := result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l353_c7_5aa8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l350_c7_3bea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l353_c7_5aa8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3bea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l353_c7_5aa8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l345_c2_065c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l350_c7_3bea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_return_output := result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l350_c7_3bea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l350_c7_3bea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3bea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3bea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3bea_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l345_c2_065c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l345_c2_065c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_return_output := result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l345_c2_065c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_return_output;

     -- Submodule level 16
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l410_l341_DUPLICATE_db72 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l410_l341_DUPLICATE_db72_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c2_065c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c2_065c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c2_065c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c2_065c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c2_065c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c2_065c_return_output);

     -- Submodule level 17
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l410_l341_DUPLICATE_db72_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l410_l341_DUPLICATE_db72_return_output;
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
