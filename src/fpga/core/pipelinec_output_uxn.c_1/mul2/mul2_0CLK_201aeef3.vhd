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
 previous_stack_read : in unsigned(7 downto 0);
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
-- BIN_OP_EQ[uxn_opcodes_h_l2332_c6_b024]
signal BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2332_c1_00dc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2332_c2_8462]
signal n16_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2332_c2_8462]
signal t16_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2332_c2_8462]
signal tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2332_c2_8462]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2332_c2_8462]
signal result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2332_c2_8462]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2332_c2_8462]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2332_c2_8462]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2332_c2_8462]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2332_c2_8462]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2333_c3_5f3a[uxn_opcodes_h_l2333_c3_5f3a]
signal printf_uxn_opcodes_h_l2333_c3_5f3a_uxn_opcodes_h_l2333_c3_5f3a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2338_c11_4635]
signal BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2338_c7_fddf]
signal n16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2338_c7_fddf]
signal t16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2338_c7_fddf]
signal tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2338_c7_fddf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2338_c7_fddf]
signal result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2338_c7_fddf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2338_c7_fddf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2338_c7_fddf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2338_c7_fddf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2338_c7_fddf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2341_c11_6aa6]
signal BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2341_c7_d13e]
signal n16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2341_c7_d13e]
signal t16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2341_c7_d13e]
signal tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2341_c7_d13e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2341_c7_d13e]
signal result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2341_c7_d13e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2341_c7_d13e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2341_c7_d13e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2341_c7_d13e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2341_c7_d13e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2346_c11_88fa]
signal BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2346_c7_2145]
signal n16_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2346_c7_2145]
signal t16_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2346_c7_2145]
signal tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2346_c7_2145]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2346_c7_2145]
signal result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2346_c7_2145]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2346_c7_2145]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2346_c7_2145]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2346_c7_2145]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2346_c7_2145]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2349_c11_f357]
signal BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2349_c7_ac9f]
signal n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2349_c7_ac9f]
signal t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2349_c7_ac9f]
signal tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2349_c7_ac9f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2349_c7_ac9f]
signal result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2349_c7_ac9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2349_c7_ac9f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2349_c7_ac9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2349_c7_ac9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2349_c7_ac9f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2350_c3_c9f2]
signal BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2353_c11_1cc7]
signal BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2353_c7_7a38]
signal n16_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2353_c7_7a38]
signal tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2353_c7_7a38]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2353_c7_7a38]
signal result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2353_c7_7a38]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2353_c7_7a38]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2353_c7_7a38]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2353_c7_7a38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2353_c7_7a38]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2356_c11_9b86]
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2356_c7_0c3e]
signal n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2356_c7_0c3e]
signal tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2356_c7_0c3e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2356_c7_0c3e]
signal result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2356_c7_0c3e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2356_c7_0c3e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2356_c7_0c3e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2356_c7_0c3e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2356_c7_0c3e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2361_c11_3d9c]
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2361_c7_3dec]
signal n16_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2361_c7_3dec]
signal tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2361_c7_3dec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2361_c7_3dec]
signal result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2361_c7_3dec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2361_c7_3dec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2361_c7_3dec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2361_c7_3dec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2361_c7_3dec]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_68b5]
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2364_c7_f8f9]
signal n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2364_c7_f8f9]
signal tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c7_f8f9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2364_c7_f8f9]
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c7_f8f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_f8f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c7_f8f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_f8f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2364_c7_f8f9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2365_c3_3d21]
signal BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2366_c11_ed0b]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2369_c32_c1ff]
signal BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2369_c32_5362]
signal BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2369_c32_fea8]
signal MUX_uxn_opcodes_h_l2369_c32_fea8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2369_c32_fea8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2369_c32_fea8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2369_c32_fea8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2371_c11_6374]
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2371_c7_4c12]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2371_c7_4c12]
signal result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2371_c7_4c12]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2371_c7_4c12]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2371_c7_4c12]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2377_c11_e922]
signal BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2377_c7_381c]
signal result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2377_c7_381c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2377_c7_381c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2377_c7_381c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2379_c34_59ac]
signal CONST_SR_8_uxn_opcodes_h_l2379_c34_59ac_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2379_c34_59ac_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2381_c11_32b9]
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2381_c7_8aff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2381_c7_8aff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024
BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_left,
BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_right,
BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_return_output);

-- n16_MUX_uxn_opcodes_h_l2332_c2_8462
n16_MUX_uxn_opcodes_h_l2332_c2_8462 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2332_c2_8462_cond,
n16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue,
n16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse,
n16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output);

-- t16_MUX_uxn_opcodes_h_l2332_c2_8462
t16_MUX_uxn_opcodes_h_l2332_c2_8462 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2332_c2_8462_cond,
t16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue,
t16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse,
t16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2332_c2_8462
tmp16_MUX_uxn_opcodes_h_l2332_c2_8462 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_cond,
tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue,
tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse,
tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462
result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462
result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_cond,
result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462
result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462
result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462
result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462
result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_return_output);

-- printf_uxn_opcodes_h_l2333_c3_5f3a_uxn_opcodes_h_l2333_c3_5f3a
printf_uxn_opcodes_h_l2333_c3_5f3a_uxn_opcodes_h_l2333_c3_5f3a : entity work.printf_uxn_opcodes_h_l2333_c3_5f3a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2333_c3_5f3a_uxn_opcodes_h_l2333_c3_5f3a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635
BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_left,
BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_right,
BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_return_output);

-- n16_MUX_uxn_opcodes_h_l2338_c7_fddf
n16_MUX_uxn_opcodes_h_l2338_c7_fddf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond,
n16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue,
n16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse,
n16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output);

-- t16_MUX_uxn_opcodes_h_l2338_c7_fddf
t16_MUX_uxn_opcodes_h_l2338_c7_fddf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond,
t16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue,
t16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse,
t16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf
tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond,
tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue,
tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse,
tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf
result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf
result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_cond,
result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf
result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf
result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf
result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6
BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_left,
BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_right,
BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_return_output);

-- n16_MUX_uxn_opcodes_h_l2341_c7_d13e
n16_MUX_uxn_opcodes_h_l2341_c7_d13e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond,
n16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue,
n16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse,
n16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output);

-- t16_MUX_uxn_opcodes_h_l2341_c7_d13e
t16_MUX_uxn_opcodes_h_l2341_c7_d13e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond,
t16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue,
t16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse,
t16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e
tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond,
tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e
result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e
result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e
result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e
result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e
result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa
BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_left,
BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_right,
BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_return_output);

-- n16_MUX_uxn_opcodes_h_l2346_c7_2145
n16_MUX_uxn_opcodes_h_l2346_c7_2145 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2346_c7_2145_cond,
n16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue,
n16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse,
n16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output);

-- t16_MUX_uxn_opcodes_h_l2346_c7_2145
t16_MUX_uxn_opcodes_h_l2346_c7_2145 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2346_c7_2145_cond,
t16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue,
t16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse,
t16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2346_c7_2145
tmp16_MUX_uxn_opcodes_h_l2346_c7_2145 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_cond,
tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue,
tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse,
tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145
result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145
result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_cond,
result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145
result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145
result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145
result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145
result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357
BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_left,
BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_right,
BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_return_output);

-- n16_MUX_uxn_opcodes_h_l2349_c7_ac9f
n16_MUX_uxn_opcodes_h_l2349_c7_ac9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond,
n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue,
n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse,
n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output);

-- t16_MUX_uxn_opcodes_h_l2349_c7_ac9f
t16_MUX_uxn_opcodes_h_l2349_c7_ac9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond,
t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue,
t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse,
t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f
tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond,
tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f
result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f
result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f
result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f
result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f
result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2
BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_left,
BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_right,
BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_left,
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_right,
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_return_output);

-- n16_MUX_uxn_opcodes_h_l2353_c7_7a38
n16_MUX_uxn_opcodes_h_l2353_c7_7a38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2353_c7_7a38_cond,
n16_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue,
n16_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse,
n16_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38
tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_cond,
tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue,
tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse,
tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38
result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38
result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_cond,
result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38
result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38
result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_left,
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_right,
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_return_output);

-- n16_MUX_uxn_opcodes_h_l2356_c7_0c3e
n16_MUX_uxn_opcodes_h_l2356_c7_0c3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond,
n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue,
n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse,
n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e
tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond,
tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e
result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e
result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e
result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e
result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_left,
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_right,
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_return_output);

-- n16_MUX_uxn_opcodes_h_l2361_c7_3dec
n16_MUX_uxn_opcodes_h_l2361_c7_3dec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2361_c7_3dec_cond,
n16_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue,
n16_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse,
n16_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec
tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_cond,
tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue,
tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse,
tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec
result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_cond,
result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec
result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_left,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_right,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_return_output);

-- n16_MUX_uxn_opcodes_h_l2364_c7_f8f9
n16_MUX_uxn_opcodes_h_l2364_c7_f8f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond,
n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue,
n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse,
n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9
tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond,
tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9
result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21
BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_left,
BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_right,
BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff
BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_left,
BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_right,
BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362
BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_left,
BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_right,
BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_return_output);

-- MUX_uxn_opcodes_h_l2369_c32_fea8
MUX_uxn_opcodes_h_l2369_c32_fea8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2369_c32_fea8_cond,
MUX_uxn_opcodes_h_l2369_c32_fea8_iftrue,
MUX_uxn_opcodes_h_l2369_c32_fea8_iffalse,
MUX_uxn_opcodes_h_l2369_c32_fea8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_left,
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_right,
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12
result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12
result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_cond,
result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12
result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_left,
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_right,
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c
result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c
result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2379_c34_59ac
CONST_SR_8_uxn_opcodes_h_l2379_c34_59ac : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2379_c34_59ac_x,
CONST_SR_8_uxn_opcodes_h_l2379_c34_59ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_left,
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_right,
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa
CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_return_output,
 n16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output,
 t16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output,
 tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_return_output,
 n16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output,
 t16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output,
 tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_return_output,
 n16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output,
 t16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_return_output,
 n16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output,
 t16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output,
 tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_return_output,
 n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output,
 t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_return_output,
 n16_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output,
 tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_return_output,
 n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_return_output,
 n16_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output,
 tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_return_output,
 n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_return_output,
 MUX_uxn_opcodes_h_l2369_c32_fea8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_return_output,
 CONST_SR_8_uxn_opcodes_h_l2379_c34_59ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2335_c3_ccbe : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2333_c3_5f3a_uxn_opcodes_h_l2333_c3_5f3a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2339_c3_173e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2344_c3_461a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2347_c3_ce53 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2351_c3_0445 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_aeb6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_9c6a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_8558 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2366_c3_0da8 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2369_c32_fea8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2369_c32_fea8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2369_c32_fea8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2369_c32_fea8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2374_c3_008a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2375_c24_a9cb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_5439 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2379_c34_59ac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2379_c34_59ac_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2379_c24_48ea_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2371_l2346_l2341_DUPLICATE_2e96_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_33f5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2381_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_fd61_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_007e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2381_l2353_l2377_l2349_l2371_l2346_l2364_l2341_DUPLICATE_c481_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_1499_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2365_l2342_l2350_l2357_DUPLICATE_1a41_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2377_l2364_DUPLICATE_b6ff_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2386_l2328_DUPLICATE_d154_return_output : opcode_result_t;
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
     VAR_BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_9c6a := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_9c6a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2347_c3_ce53 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2347_c3_ce53;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_aeb6 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_aeb6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2339_c3_173e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2339_c3_173e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_8558 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_8558;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l2369_c32_fea8_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2344_c3_461a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2344_c3_461a;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2374_c3_008a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2374_c3_008a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l2369_c32_fea8_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2351_c3_0445 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2351_c3_0445;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2335_c3_ccbe := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2335_c3_ccbe;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_5439 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_5439;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_right := to_unsigned(10, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2379_c34_59ac_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2349_c11_f357] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_left;
     BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_return_output := BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2377_c11_e922] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_left;
     BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_return_output := BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2365_l2342_l2350_l2357_DUPLICATE_1a41 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2365_l2342_l2350_l2357_DUPLICATE_1a41_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2381_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_fd61 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2381_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_fd61_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l2379_c34_59ac] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2379_c34_59ac_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2379_c34_59ac_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2379_c34_59ac_return_output := CONST_SR_8_uxn_opcodes_h_l2379_c34_59ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2341_c11_6aa6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2369_c32_c1ff] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_left;
     BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_return_output := BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2332_c6_b024] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_left;
     BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_return_output := BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2353_c11_1cc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2371_c11_6374] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_left;
     BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_return_output := BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2375_c24_a9cb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2375_c24_a9cb_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2346_c11_88fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2381_l2353_l2377_l2349_l2371_l2346_l2364_l2341_DUPLICATE_c481 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2381_l2353_l2377_l2349_l2371_l2346_l2364_l2341_DUPLICATE_c481_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_1499 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_1499_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_007e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_007e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2356_c11_9b86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_left;
     BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_return_output := BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2381_c11_32b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2377_l2364_DUPLICATE_b6ff LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2377_l2364_DUPLICATE_b6ff_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_68b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2361_c11_3d9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2338_c11_4635] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_left;
     BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_return_output := BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_33f5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_33f5_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2371_l2346_l2341_DUPLICATE_2e96 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2371_l2346_l2341_DUPLICATE_2e96_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2369_c32_c1ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2332_c2_8462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2332_c2_8462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2332_c6_b024_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_4635_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2341_c11_6aa6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2346_c7_2145_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2346_c7_2145_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_88fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c11_f357_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2353_c7_7a38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_1cc7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_9b86_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2361_c7_3dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_3d9c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_68b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_6374_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_e922_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_32b9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2365_l2342_l2350_l2357_DUPLICATE_1a41_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2365_l2342_l2350_l2357_DUPLICATE_1a41_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2365_l2342_l2350_l2357_DUPLICATE_1a41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2375_c24_a9cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_007e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_007e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_007e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_007e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_007e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_007e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_007e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_007e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_007e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2381_l2353_l2377_l2349_l2371_l2346_l2364_l2341_DUPLICATE_c481_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2381_l2353_l2377_l2349_l2371_l2346_l2364_l2341_DUPLICATE_c481_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2381_l2353_l2377_l2349_l2371_l2346_l2364_l2341_DUPLICATE_c481_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2381_l2353_l2377_l2349_l2371_l2346_l2364_l2341_DUPLICATE_c481_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2381_l2353_l2377_l2349_l2371_l2346_l2364_l2341_DUPLICATE_c481_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2381_l2353_l2377_l2349_l2371_l2346_l2364_l2341_DUPLICATE_c481_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2381_l2353_l2377_l2349_l2371_l2346_l2364_l2341_DUPLICATE_c481_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2381_l2353_l2377_l2349_l2371_l2346_l2364_l2341_DUPLICATE_c481_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2381_l2353_l2377_l2349_l2371_l2346_l2364_l2341_DUPLICATE_c481_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2381_l2353_l2377_l2349_l2371_l2346_l2364_l2341_DUPLICATE_c481_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2381_l2353_l2377_l2349_l2371_l2346_l2364_l2341_DUPLICATE_c481_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2371_l2346_l2341_DUPLICATE_2e96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2371_l2346_l2341_DUPLICATE_2e96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2371_l2346_l2341_DUPLICATE_2e96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2371_l2346_l2341_DUPLICATE_2e96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2371_l2346_l2341_DUPLICATE_2e96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2371_l2346_l2341_DUPLICATE_2e96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2371_l2346_l2341_DUPLICATE_2e96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2371_l2346_l2341_DUPLICATE_2e96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2349_l2371_l2346_l2341_DUPLICATE_2e96_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_1499_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_1499_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_1499_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_1499_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_1499_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_1499_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_1499_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2338_l2361_l2356_l2353_l2349_l2346_l2364_l2341_DUPLICATE_1499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2381_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_fd61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2381_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_fd61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2381_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_fd61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2381_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_fd61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2381_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_fd61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2381_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_fd61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2381_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_fd61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2381_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_fd61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2381_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_fd61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2381_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_fd61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2381_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_fd61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2377_l2364_DUPLICATE_b6ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2377_l2364_DUPLICATE_b6ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_33f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_33f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_33f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_33f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_33f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_33f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_33f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_33f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_33f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2338_l2361_l2332_l2356_l2353_l2377_l2349_l2346_l2364_l2341_DUPLICATE_33f5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2377_c7_381c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2365_c3_3d21] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_left;
     BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_return_output := BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2379_c24_48ea] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2379_c24_48ea_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2379_c34_59ac_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2381_c7_8aff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2350_c3_c9f2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_left;
     BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_return_output := BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2371_c7_4c12] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2381_c7_8aff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2332_c1_00dc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2364_c7_f8f9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2369_c32_5362] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_left;
     BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_return_output := BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2369_c32_fea8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2369_c32_5362_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2350_c3_c9f2_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2365_c3_3d21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2379_c24_48ea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2343_l2358_DUPLICATE_ddfa_return_output;
     VAR_printf_uxn_opcodes_h_l2333_c3_5f3a_uxn_opcodes_h_l2333_c3_5f3a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2332_c1_00dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_8aff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_8aff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_381c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c7_f8f9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;

     -- t16_MUX[uxn_opcodes_h_l2349_c7_ac9f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond;
     t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue;
     t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output := t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2366_c11_ed0b] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2364_c7_f8f9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond;
     n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue;
     n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output := n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2377_c7_381c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2361_c7_3dec] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;

     -- MUX[uxn_opcodes_h_l2369_c32_fea8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2369_c32_fea8_cond <= VAR_MUX_uxn_opcodes_h_l2369_c32_fea8_cond;
     MUX_uxn_opcodes_h_l2369_c32_fea8_iftrue <= VAR_MUX_uxn_opcodes_h_l2369_c32_fea8_iftrue;
     MUX_uxn_opcodes_h_l2369_c32_fea8_iffalse <= VAR_MUX_uxn_opcodes_h_l2369_c32_fea8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2369_c32_fea8_return_output := MUX_uxn_opcodes_h_l2369_c32_fea8_return_output;

     -- printf_uxn_opcodes_h_l2333_c3_5f3a[uxn_opcodes_h_l2333_c3_5f3a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2333_c3_5f3a_uxn_opcodes_h_l2333_c3_5f3a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2333_c3_5f3a_uxn_opcodes_h_l2333_c3_5f3a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2377_c7_381c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2377_c7_381c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2371_c7_4c12] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2366_c3_0da8 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2366_c11_ed0b_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue := VAR_MUX_uxn_opcodes_h_l2369_c32_fea8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_381c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_381c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_381c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue := VAR_tmp16_uxn_opcodes_h_l2366_c3_0da8;
     -- tmp16_MUX[uxn_opcodes_h_l2364_c7_f8f9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond;
     tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output := tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2371_c7_4c12] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output := result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c7_f8f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2361_c7_3dec] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2361_c7_3dec_cond <= VAR_n16_MUX_uxn_opcodes_h_l2361_c7_3dec_cond;
     n16_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue;
     n16_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output := n16_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2371_c7_4c12] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2356_c7_0c3e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2371_c7_4c12] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_f8f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2361_c7_3dec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;

     -- t16_MUX[uxn_opcodes_h_l2346_c7_2145] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2346_c7_2145_cond <= VAR_t16_MUX_uxn_opcodes_h_l2346_c7_2145_cond;
     t16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue;
     t16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output := t16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2371_c7_4c12_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;
     -- n16_MUX[uxn_opcodes_h_l2356_c7_0c3e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond;
     n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue;
     n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output := n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2361_c7_3dec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2361_c7_3dec] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_cond;
     tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output := tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2364_c7_f8f9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2356_c7_0c3e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_f8f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;

     -- t16_MUX[uxn_opcodes_h_l2341_c7_d13e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond;
     t16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue;
     t16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output := t16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2361_c7_3dec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c7_f8f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2353_c7_7a38] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_f8f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2361_c7_3dec] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output := result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2356_c7_0c3e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2356_c7_0c3e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2361_c7_3dec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2356_c7_0c3e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond;
     tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output := tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2353_c7_7a38] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;

     -- t16_MUX[uxn_opcodes_h_l2338_c7_fddf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond <= VAR_t16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond;
     t16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue;
     t16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output := t16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2361_c7_3dec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;

     -- n16_MUX[uxn_opcodes_h_l2353_c7_7a38] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2353_c7_7a38_cond <= VAR_n16_MUX_uxn_opcodes_h_l2353_c7_7a38_cond;
     n16_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue;
     n16_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output := n16_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2349_c7_ac9f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_3dec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2356_c7_0c3e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2349_c7_ac9f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2353_c7_7a38] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2356_c7_0c3e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2353_c7_7a38] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_cond;
     tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output := tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;

     -- n16_MUX[uxn_opcodes_h_l2349_c7_ac9f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond;
     n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue;
     n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output := n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2356_c7_0c3e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2353_c7_7a38] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2346_c7_2145] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;

     -- t16_MUX[uxn_opcodes_h_l2332_c2_8462] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2332_c2_8462_cond <= VAR_t16_MUX_uxn_opcodes_h_l2332_c2_8462_cond;
     t16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue;
     t16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output := t16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2356_c7_0c3e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2353_c7_7a38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2349_c7_ac9f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond;
     tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output := tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2353_c7_7a38] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2346_c7_2145] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2353_c7_7a38] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output := result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2341_c7_d13e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2346_c7_2145] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2346_c7_2145_cond <= VAR_n16_MUX_uxn_opcodes_h_l2346_c7_2145_cond;
     n16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue;
     n16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output := n16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2349_c7_ac9f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2349_c7_ac9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2353_c7_7a38_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2341_c7_d13e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2341_c7_d13e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond;
     n16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue;
     n16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output := n16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2346_c7_2145] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2349_c7_ac9f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2338_c7_fddf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2346_c7_2145] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2349_c7_ac9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2349_c7_ac9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2346_c7_2145] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_cond;
     tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output := tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2349_c7_ac9f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2346_c7_2145] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2332_c2_8462] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2346_c7_2145] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_return_output := result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2341_c7_d13e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2341_c7_d13e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_cond;
     tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output := tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2346_c7_2145] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2338_c7_fddf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;

     -- n16_MUX[uxn_opcodes_h_l2338_c7_fddf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond <= VAR_n16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond;
     n16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue;
     n16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output := n16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2341_c7_d13e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_2145_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2341_c7_d13e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2338_c7_fddf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_cond;
     tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output := tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2341_c7_d13e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2332_c2_8462] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2332_c2_8462_cond <= VAR_n16_MUX_uxn_opcodes_h_l2332_c2_8462_cond;
     n16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue;
     n16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output := n16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2338_c7_fddf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2332_c2_8462] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2338_c7_fddf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2341_c7_d13e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2341_c7_d13e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2332_c2_8462] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2338_c7_fddf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2332_c2_8462] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2332_c2_8462] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_cond;
     tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output := tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2338_c7_fddf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output := result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2338_c7_fddf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2338_c7_fddf_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2332_c2_8462_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2332_c2_8462] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2332_c2_8462] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_return_output := result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2332_c2_8462] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2386_l2328_DUPLICATE_d154 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2386_l2328_DUPLICATE_d154_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2332_c2_8462_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2332_c2_8462_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2332_c2_8462_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2332_c2_8462_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2332_c2_8462_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2332_c2_8462_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2332_c2_8462_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2386_l2328_DUPLICATE_d154_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2386_l2328_DUPLICATE_d154_return_output;
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
