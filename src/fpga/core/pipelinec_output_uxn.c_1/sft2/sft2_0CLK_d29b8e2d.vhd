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
-- Submodules: 104
entity sft2_0CLK_d29b8e2d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_d29b8e2d;
architecture arch of sft2_0CLK_d29b8e2d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2570_c6_dc13]
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2570_c1_ecab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2570_c2_3bf1]
signal t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2570_c2_3bf1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2570_c2_3bf1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2570_c2_3bf1]
signal result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2570_c2_3bf1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2570_c2_3bf1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2570_c2_3bf1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2570_c2_3bf1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2570_c2_3bf1]
signal tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2570_c2_3bf1]
signal n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2571_c3_f90b[uxn_opcodes_h_l2571_c3_f90b]
signal printf_uxn_opcodes_h_l2571_c3_f90b_uxn_opcodes_h_l2571_c3_f90b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2576_c11_bf10]
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2576_c7_1055]
signal t8_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2576_c7_1055]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2576_c7_1055]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2576_c7_1055]
signal result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2576_c7_1055]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2576_c7_1055]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2576_c7_1055]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2576_c7_1055]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2576_c7_1055]
signal tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2576_c7_1055]
signal n16_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2579_c11_d12f]
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2579_c7_3230]
signal t8_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2579_c7_3230]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2579_c7_3230]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2579_c7_3230]
signal result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2579_c7_3230]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2579_c7_3230]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2579_c7_3230]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2579_c7_3230]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2579_c7_3230]
signal tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2579_c7_3230]
signal n16_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2583_c11_95db]
signal BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2583_c7_aff3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2583_c7_aff3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2583_c7_aff3]
signal result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2583_c7_aff3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2583_c7_aff3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2583_c7_aff3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2583_c7_aff3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2583_c7_aff3]
signal tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2583_c7_aff3]
signal n16_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2586_c11_ae78]
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2586_c7_066d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2586_c7_066d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2586_c7_066d]
signal result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2586_c7_066d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c7_066d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c7_066d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c7_066d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2586_c7_066d]
signal tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2586_c7_066d]
signal n16_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2588_c3_56e0]
signal CONST_SL_8_uxn_opcodes_h_l2588_c3_56e0_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2588_c3_56e0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2591_c11_4529]
signal BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2591_c7_6b9e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2591_c7_6b9e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2591_c7_6b9e]
signal result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2591_c7_6b9e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2591_c7_6b9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2591_c7_6b9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2591_c7_6b9e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2591_c7_6b9e]
signal tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2591_c7_6b9e]
signal n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2594_c11_53a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2594_c7_96c7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2594_c7_96c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2594_c7_96c7]
signal result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2594_c7_96c7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2594_c7_96c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2594_c7_96c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2594_c7_96c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2594_c7_96c7]
signal tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2594_c7_96c7]
signal n16_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2595_c3_cd72]
signal BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2598_c32_7227]
signal BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2598_c32_d30c]
signal BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2598_c32_bf38]
signal MUX_uxn_opcodes_h_l2598_c32_bf38_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2598_c32_bf38_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2598_c32_bf38_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2598_c32_bf38_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2600_c11_51a8]
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2600_c7_d872]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2600_c7_d872]
signal result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2600_c7_d872]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2600_c7_d872]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2600_c7_d872]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2600_c7_d872]
signal tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2601_c20_d47f]
signal BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2601_c12_f80d]
signal BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2601_c36_142f]
signal CONST_SR_4_uxn_opcodes_h_l2601_c36_142f_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2601_c36_142f_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2601_c12_ca7e]
signal BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2607_c11_3a24]
signal BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2607_c7_e889]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2607_c7_e889]
signal result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2607_c7_e889]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2607_c7_e889]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2609_c34_1446]
signal CONST_SR_8_uxn_opcodes_h_l2609_c34_1446_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2609_c34_1446_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2611_c11_ec26]
signal BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2611_c7_8875]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2611_c7_8875]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13
BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_left,
BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_right,
BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_return_output);

-- t8_MUX_uxn_opcodes_h_l2570_c2_3bf1
t8_MUX_uxn_opcodes_h_l2570_c2_3bf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond,
t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue,
t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse,
t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1
result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1
result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1
result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1
result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1
tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond,
tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output);

-- n16_MUX_uxn_opcodes_h_l2570_c2_3bf1
n16_MUX_uxn_opcodes_h_l2570_c2_3bf1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond,
n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue,
n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse,
n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output);

-- printf_uxn_opcodes_h_l2571_c3_f90b_uxn_opcodes_h_l2571_c3_f90b
printf_uxn_opcodes_h_l2571_c3_f90b_uxn_opcodes_h_l2571_c3_f90b : entity work.printf_uxn_opcodes_h_l2571_c3_f90b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2571_c3_f90b_uxn_opcodes_h_l2571_c3_f90b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_left,
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_right,
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_return_output);

-- t8_MUX_uxn_opcodes_h_l2576_c7_1055
t8_MUX_uxn_opcodes_h_l2576_c7_1055 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2576_c7_1055_cond,
t8_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue,
t8_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse,
t8_MUX_uxn_opcodes_h_l2576_c7_1055_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055
result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055
result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_cond,
result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2576_c7_1055
tmp16_MUX_uxn_opcodes_h_l2576_c7_1055 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_cond,
tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue,
tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse,
tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_return_output);

-- n16_MUX_uxn_opcodes_h_l2576_c7_1055
n16_MUX_uxn_opcodes_h_l2576_c7_1055 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2576_c7_1055_cond,
n16_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue,
n16_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse,
n16_MUX_uxn_opcodes_h_l2576_c7_1055_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_left,
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_right,
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_return_output);

-- t8_MUX_uxn_opcodes_h_l2579_c7_3230
t8_MUX_uxn_opcodes_h_l2579_c7_3230 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2579_c7_3230_cond,
t8_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue,
t8_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse,
t8_MUX_uxn_opcodes_h_l2579_c7_3230_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230
result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230
result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_cond,
result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2579_c7_3230
tmp16_MUX_uxn_opcodes_h_l2579_c7_3230 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_cond,
tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue,
tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse,
tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_return_output);

-- n16_MUX_uxn_opcodes_h_l2579_c7_3230
n16_MUX_uxn_opcodes_h_l2579_c7_3230 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2579_c7_3230_cond,
n16_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue,
n16_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse,
n16_MUX_uxn_opcodes_h_l2579_c7_3230_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_left,
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_right,
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3
result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3
result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3
result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3
tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_cond,
tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue,
tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse,
tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output);

-- n16_MUX_uxn_opcodes_h_l2583_c7_aff3
n16_MUX_uxn_opcodes_h_l2583_c7_aff3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2583_c7_aff3_cond,
n16_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue,
n16_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse,
n16_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_left,
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_right,
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d
result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d
result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d
result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2586_c7_066d
tmp16_MUX_uxn_opcodes_h_l2586_c7_066d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_cond,
tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_return_output);

-- n16_MUX_uxn_opcodes_h_l2586_c7_066d
n16_MUX_uxn_opcodes_h_l2586_c7_066d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2586_c7_066d_cond,
n16_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue,
n16_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse,
n16_MUX_uxn_opcodes_h_l2586_c7_066d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2588_c3_56e0
CONST_SL_8_uxn_opcodes_h_l2588_c3_56e0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2588_c3_56e0_x,
CONST_SL_8_uxn_opcodes_h_l2588_c3_56e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529
BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_left,
BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_right,
BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e
result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e
result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e
result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e
result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e
result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e
tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond,
tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output);

-- n16_MUX_uxn_opcodes_h_l2591_c7_6b9e
n16_MUX_uxn_opcodes_h_l2591_c7_6b9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond,
n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue,
n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse,
n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5
BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7
result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7
result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7
result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7
result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7
result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7
tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_cond,
tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output);

-- n16_MUX_uxn_opcodes_h_l2594_c7_96c7
n16_MUX_uxn_opcodes_h_l2594_c7_96c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2594_c7_96c7_cond,
n16_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue,
n16_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse,
n16_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72
BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_left,
BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_right,
BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227
BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_left,
BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_right,
BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c
BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_left,
BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_right,
BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_return_output);

-- MUX_uxn_opcodes_h_l2598_c32_bf38
MUX_uxn_opcodes_h_l2598_c32_bf38 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2598_c32_bf38_cond,
MUX_uxn_opcodes_h_l2598_c32_bf38_iftrue,
MUX_uxn_opcodes_h_l2598_c32_bf38_iffalse,
MUX_uxn_opcodes_h_l2598_c32_bf38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_left,
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_right,
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872
result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872
result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_cond,
result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2600_c7_d872
tmp16_MUX_uxn_opcodes_h_l2600_c7_d872 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_cond,
tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue,
tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse,
tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f
BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_left,
BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_right,
BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d
BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_left,
BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_right,
BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2601_c36_142f
CONST_SR_4_uxn_opcodes_h_l2601_c36_142f : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2601_c36_142f_x,
CONST_SR_4_uxn_opcodes_h_l2601_c36_142f_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e
BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_left,
BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_right,
BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24
BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_left,
BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_right,
BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889
result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889
result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_cond,
result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889
result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2609_c34_1446
CONST_SR_8_uxn_opcodes_h_l2609_c34_1446 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2609_c34_1446_x,
CONST_SR_8_uxn_opcodes_h_l2609_c34_1446_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26
BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_left,
BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_right,
BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875
result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875
result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_return_output,
 t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output,
 n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_return_output,
 t8_MUX_uxn_opcodes_h_l2576_c7_1055_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_return_output,
 tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_return_output,
 n16_MUX_uxn_opcodes_h_l2576_c7_1055_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_return_output,
 t8_MUX_uxn_opcodes_h_l2579_c7_3230_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_return_output,
 tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_return_output,
 n16_MUX_uxn_opcodes_h_l2579_c7_3230_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output,
 n16_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_return_output,
 n16_MUX_uxn_opcodes_h_l2586_c7_066d_return_output,
 CONST_SL_8_uxn_opcodes_h_l2588_c3_56e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output,
 n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output,
 n16_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_return_output,
 MUX_uxn_opcodes_h_l2598_c32_bf38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_return_output,
 tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_return_output,
 CONST_SR_4_uxn_opcodes_h_l2601_c36_142f_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_return_output,
 CONST_SR_8_uxn_opcodes_h_l2609_c34_1446_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_8786 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2576_c7_1055_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2571_c3_f90b_uxn_opcodes_h_l2571_c3_f90b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2577_c3_044b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2579_c7_3230_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2576_c7_1055_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2581_c3_0caf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2579_c7_3230_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_383e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2586_c7_066d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2583_c7_aff3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2589_c3_9a72 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2586_c7_066d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2588_c3_56e0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2588_c3_56e0_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2592_c3_cc10 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2594_c7_96c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2598_c32_bf38_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2598_c32_bf38_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2598_c32_bf38_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2598_c32_bf38_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_248b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2601_c36_142f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2601_c36_142f_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2605_c24_3f71_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_108c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2609_c34_1446_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2609_c34_1446_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2609_c24_2792_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_4c77_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2607_l2576_DUPLICATE_7774_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2570_l2591_l2586_l2583_l2579_l2576_l2600_DUPLICATE_216a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_DUPLICATE_1be3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_5818_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_l2600_DUPLICATE_276f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2595_l2587_DUPLICATE_fe84_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2607_l2594_DUPLICATE_79c5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2616_l2565_DUPLICATE_00d1_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2589_c3_9a72 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2589_c3_9a72;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_8786 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_8786;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2592_c3_cc10 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2592_c3_cc10;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_right := to_unsigned(9, 4);
     VAR_MUX_uxn_opcodes_h_l2598_c32_bf38_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2581_c3_0caf := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2581_c3_0caf;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_248b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_248b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_108c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_108c;
     VAR_MUX_uxn_opcodes_h_l2598_c32_bf38_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2577_c3_044b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2577_c3_044b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_383e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_383e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_left := n16;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2601_c36_142f_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2609_c34_1446_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_l2600_DUPLICATE_276f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_l2600_DUPLICATE_276f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2594_c11_53a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2595_l2587_DUPLICATE_fe84 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2595_l2587_DUPLICATE_fe84_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2583_c11_95db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_left;
     BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_return_output := BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2570_c6_dc13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_left;
     BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_return_output := BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2586_c11_ae78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_left;
     BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_return_output := BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2576_c11_bf10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_left;
     BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_return_output := BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2591_c11_4529] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_left;
     BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_return_output := BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2600_c11_51a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_4c77 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_4c77_return_output := result.sp_relative_shift;

     -- CONST_SR_4[uxn_opcodes_h_l2601_c36_142f] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2601_c36_142f_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2601_c36_142f_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2601_c36_142f_return_output := CONST_SR_4_uxn_opcodes_h_l2601_c36_142f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2611_c11_ec26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_left;
     BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_return_output := BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2607_l2576_DUPLICATE_7774 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2607_l2576_DUPLICATE_7774_return_output := result.stack_value;

     -- CONST_SR_8[uxn_opcodes_h_l2609_c34_1446] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2609_c34_1446_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2609_c34_1446_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2609_c34_1446_return_output := CONST_SR_8_uxn_opcodes_h_l2609_c34_1446_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_5818 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_5818_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l2601_c20_d47f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_left;
     BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_return_output := BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2570_l2591_l2586_l2583_l2579_l2576_l2600_DUPLICATE_216a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2570_l2591_l2586_l2583_l2579_l2576_l2600_DUPLICATE_216a_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2598_c32_7227] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_left;
     BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_return_output := BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2607_c11_3a24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_left;
     BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_return_output := BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2579_c11_d12f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_DUPLICATE_1be3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_DUPLICATE_1be3_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2607_l2594_DUPLICATE_79c5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2607_l2594_DUPLICATE_79c5_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2598_c32_7227_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2601_c20_d47f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_dc13_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2576_c7_1055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2576_c7_1055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_bf10_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2579_c7_3230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2579_c7_3230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_d12f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2583_c7_aff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_95db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2586_c7_066d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_ae78_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_4529_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2594_c7_96c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_53a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_51a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_3a24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_ec26_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2595_l2587_DUPLICATE_fe84_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2588_c3_56e0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2595_l2587_DUPLICATE_fe84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_4c77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_4c77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_4c77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_4c77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_4c77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_4c77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_4c77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_l2600_DUPLICATE_276f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_l2600_DUPLICATE_276f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_l2600_DUPLICATE_276f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_l2600_DUPLICATE_276f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_l2600_DUPLICATE_276f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_l2600_DUPLICATE_276f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_l2600_DUPLICATE_276f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_l2600_DUPLICATE_276f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_l2600_DUPLICATE_276f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2570_l2591_l2586_l2583_l2579_l2576_l2600_DUPLICATE_216a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2570_l2591_l2586_l2583_l2579_l2576_l2600_DUPLICATE_216a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2570_l2591_l2586_l2583_l2579_l2576_l2600_DUPLICATE_216a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2570_l2591_l2586_l2583_l2579_l2576_l2600_DUPLICATE_216a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2570_l2591_l2586_l2583_l2579_l2576_l2600_DUPLICATE_216a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2570_l2591_l2586_l2583_l2579_l2576_l2600_DUPLICATE_216a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2570_l2591_l2586_l2583_l2579_l2576_l2600_DUPLICATE_216a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_5818_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_5818_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_5818_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_5818_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_5818_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2594_l2591_l2586_l2583_l2579_l2576_DUPLICATE_5818_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_DUPLICATE_1be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_DUPLICATE_1be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_DUPLICATE_1be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_DUPLICATE_1be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_DUPLICATE_1be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_DUPLICATE_1be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_DUPLICATE_1be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_DUPLICATE_1be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2611_l2579_l2607_l2576_DUPLICATE_1be3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2607_l2594_DUPLICATE_79c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2607_l2594_DUPLICATE_79c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2607_l2576_DUPLICATE_7774_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2607_l2576_DUPLICATE_7774_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2607_l2576_DUPLICATE_7774_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2607_l2576_DUPLICATE_7774_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2607_l2576_DUPLICATE_7774_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2607_l2576_DUPLICATE_7774_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2607_l2576_DUPLICATE_7774_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2570_l2594_l2591_l2586_l2583_l2579_l2607_l2576_DUPLICATE_7774_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_right := VAR_CONST_SR_4_uxn_opcodes_h_l2601_c36_142f_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2594_c7_96c7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2609_c24_2792] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2609_c24_2792_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2609_c34_1446_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2607_c7_e889] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2570_c1_ecab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2588_c3_56e0] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2588_c3_56e0_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2588_c3_56e0_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2588_c3_56e0_return_output := CONST_SL_8_uxn_opcodes_h_l2588_c3_56e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2611_c7_8875] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_return_output;

     -- t8_MUX[uxn_opcodes_h_l2579_c7_3230] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2579_c7_3230_cond <= VAR_t8_MUX_uxn_opcodes_h_l2579_c7_3230_cond;
     t8_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue;
     t8_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2579_c7_3230_return_output := t8_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2600_c7_d872] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2611_c7_8875] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2595_c3_cd72] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_left;
     BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_return_output := BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2598_c32_d30c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_left;
     BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_return_output := BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2601_c12_f80d] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_left;
     BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_return_output := BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2598_c32_bf38_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2598_c32_d30c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2595_c3_cd72_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2601_c12_f80d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2609_c24_2792_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2588_c3_56e0_return_output;
     VAR_printf_uxn_opcodes_h_l2571_c3_f90b_uxn_opcodes_h_l2571_c3_f90b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_ecab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_8875_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c7_d872_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_8875_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_e889_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2607_c7_e889] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2591_c7_6b9e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2594_c7_96c7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2594_c7_96c7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2594_c7_96c7_cond;
     n16_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue;
     n16_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output := n16_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;

     -- t8_MUX[uxn_opcodes_h_l2576_c7_1055] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2576_c7_1055_cond <= VAR_t8_MUX_uxn_opcodes_h_l2576_c7_1055_cond;
     t8_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue;
     t8_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2576_c7_1055_return_output := t8_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;

     -- MUX[uxn_opcodes_h_l2598_c32_bf38] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2598_c32_bf38_cond <= VAR_MUX_uxn_opcodes_h_l2598_c32_bf38_cond;
     MUX_uxn_opcodes_h_l2598_c32_bf38_iftrue <= VAR_MUX_uxn_opcodes_h_l2598_c32_bf38_iftrue;
     MUX_uxn_opcodes_h_l2598_c32_bf38_iffalse <= VAR_MUX_uxn_opcodes_h_l2598_c32_bf38_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2598_c32_bf38_return_output := MUX_uxn_opcodes_h_l2598_c32_bf38_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2607_c7_e889] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2601_c12_ca7e] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_left;
     BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_return_output := BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_return_output;

     -- printf_uxn_opcodes_h_l2571_c3_f90b[uxn_opcodes_h_l2571_c3_f90b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2571_c3_f90b_uxn_opcodes_h_l2571_c3_f90b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2571_c3_f90b_uxn_opcodes_h_l2571_c3_f90b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2600_c7_d872] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2607_c7_e889] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_return_output := result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2594_c7_96c7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue := VAR_MUX_uxn_opcodes_h_l2598_c32_bf38_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_e889_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_e889_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_d872_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2607_c7_e889_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2594_c7_96c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2594_c7_96c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2591_c7_6b9e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2600_c7_d872] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_cond;
     tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_return_output := tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2600_c7_d872] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2600_c7_d872] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_return_output;

     -- n16_MUX[uxn_opcodes_h_l2591_c7_6b9e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond;
     n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue;
     n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output := n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;

     -- t8_MUX[uxn_opcodes_h_l2570_c2_3bf1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond <= VAR_t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond;
     t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue;
     t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output := t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2605_c24_3f71] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2605_c24_3f71_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2601_c12_ca7e_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2586_c7_066d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;

     -- Submodule level 4
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2605_c24_3f71_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_d872_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_d872_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2600_c7_d872_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2591_c7_6b9e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2583_c7_aff3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2591_c7_6b9e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2594_c7_96c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2600_c7_d872] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_return_output := result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_return_output;

     -- n16_MUX[uxn_opcodes_h_l2586_c7_066d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2586_c7_066d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2586_c7_066d_cond;
     n16_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue;
     n16_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2586_c7_066d_return_output := n16_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2586_c7_066d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2594_c7_96c7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_cond;
     tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output := tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2594_c7_96c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_d872_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;
     -- n16_MUX[uxn_opcodes_h_l2583_c7_aff3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2583_c7_aff3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2583_c7_aff3_cond;
     n16_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue;
     n16_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output := n16_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2591_c7_6b9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2591_c7_6b9e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond;
     tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output := tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2583_c7_aff3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2579_c7_3230] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2586_c7_066d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c7_066d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2591_c7_6b9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2594_c7_96c7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_96c7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;
     -- n16_MUX[uxn_opcodes_h_l2579_c7_3230] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2579_c7_3230_cond <= VAR_n16_MUX_uxn_opcodes_h_l2579_c7_3230_cond;
     n16_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue;
     n16_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2579_c7_3230_return_output := n16_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2591_c7_6b9e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c7_066d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2586_c7_066d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_cond;
     tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_return_output := tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2579_c7_3230] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2576_c7_1055] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2583_c7_aff3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2583_c7_aff3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c7_066d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2591_c7_6b9e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2583_c7_aff3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_cond;
     tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output := tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2583_c7_aff3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2576_c7_1055] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2576_c7_1055_cond <= VAR_n16_MUX_uxn_opcodes_h_l2576_c7_1055_cond;
     n16_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue;
     n16_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2576_c7_1055_return_output := n16_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2586_c7_066d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2576_c7_1055] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2579_c7_3230] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2579_c7_3230] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2583_c7_aff3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2570_c2_3bf1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_066d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;
     -- n16_MUX[uxn_opcodes_h_l2570_c2_3bf1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond;
     n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue;
     n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output := n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2579_c7_3230] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2579_c7_3230] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2583_c7_aff3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2570_c2_3bf1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2576_c7_1055] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2579_c7_3230] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_cond;
     tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_return_output := tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2576_c7_1055] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2583_c7_aff3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2576_c7_1055] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_cond;
     tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_return_output := tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2570_c2_3bf1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2570_c2_3bf1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2576_c7_1055] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2576_c7_1055] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2579_c7_3230] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_return_output := result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_3230_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2576_c7_1055] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_return_output := result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2570_c2_3bf1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2570_c2_3bf1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2570_c2_3bf1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond;
     tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output := tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output;

     -- Submodule level 11
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2576_c7_1055_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2570_c2_3bf1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2616_l2565_DUPLICATE_00d1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2616_l2565_DUPLICATE_00d1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_3bf1_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2616_l2565_DUPLICATE_00d1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2616_l2565_DUPLICATE_00d1_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
