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
-- Submodules: 73
entity ovr_0CLK_cf70ec0f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr_0CLK_cf70ec0f;
architecture arch of ovr_0CLK_cf70ec0f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l316_c6_d1f6]
signal BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l316_c1_e09d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l316_c2_bd1f]
signal t8_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l316_c2_bd1f]
signal n8_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l316_c2_bd1f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l316_c2_bd1f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l316_c2_bd1f]
signal result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l316_c2_bd1f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l316_c2_bd1f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l316_c2_bd1f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l316_c2_bd1f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l317_c3_fd8b[uxn_opcodes_h_l317_c3_fd8b]
signal printf_uxn_opcodes_h_l317_c3_fd8b_uxn_opcodes_h_l317_c3_fd8b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l322_c11_18a3]
signal BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l322_c7_9abd]
signal t8_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l322_c7_9abd]
signal n8_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l322_c7_9abd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l322_c7_9abd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l322_c7_9abd]
signal result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l322_c7_9abd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l322_c7_9abd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l322_c7_9abd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l322_c7_9abd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l325_c11_389d]
signal BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l325_c7_42c3]
signal t8_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l325_c7_42c3]
signal n8_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l325_c7_42c3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l325_c7_42c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l325_c7_42c3]
signal result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l325_c7_42c3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l325_c7_42c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l325_c7_42c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l325_c7_42c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l329_c11_b88b]
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l329_c7_d551]
signal n8_MUX_uxn_opcodes_h_l329_c7_d551_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l329_c7_d551_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l329_c7_d551_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l329_c7_d551_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l329_c7_d551]
signal result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l329_c7_d551]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l329_c7_d551]
signal result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l329_c7_d551]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l329_c7_d551]
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l329_c7_d551]
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l329_c7_d551]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l332_c11_afe6]
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l332_c7_feb8]
signal n8_MUX_uxn_opcodes_h_l332_c7_feb8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l332_c7_feb8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l332_c7_feb8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l332_c7_feb8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l332_c7_feb8]
signal result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l332_c7_feb8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l332_c7_feb8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l332_c7_feb8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l332_c7_feb8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l336_c32_89f8]
signal BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l336_c32_f08d]
signal BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l336_c32_9bbe]
signal MUX_uxn_opcodes_h_l336_c32_9bbe_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l336_c32_9bbe_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l336_c32_9bbe_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l336_c32_9bbe_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l338_c11_99ce]
signal BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l338_c7_fcb3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l338_c7_fcb3]
signal result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l338_c7_fcb3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l338_c7_fcb3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l338_c7_fcb3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l344_c11_2d8c]
signal BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l344_c7_4b5b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l344_c7_4b5b]
signal result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l344_c7_4b5b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l344_c7_4b5b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l348_c11_c4d3]
signal BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l348_c7_526a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l348_c7_526a]
signal result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l348_c7_526a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l348_c7_526a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_b55b]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_ef47]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_ef47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6
BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_left,
BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_right,
BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_return_output);

-- t8_MUX_uxn_opcodes_h_l316_c2_bd1f
t8_MUX_uxn_opcodes_h_l316_c2_bd1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l316_c2_bd1f_cond,
t8_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue,
t8_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse,
t8_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output);

-- n8_MUX_uxn_opcodes_h_l316_c2_bd1f
n8_MUX_uxn_opcodes_h_l316_c2_bd1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l316_c2_bd1f_cond,
n8_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue,
n8_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse,
n8_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f
result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f
result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_cond,
result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f
result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f
result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output);

-- printf_uxn_opcodes_h_l317_c3_fd8b_uxn_opcodes_h_l317_c3_fd8b
printf_uxn_opcodes_h_l317_c3_fd8b_uxn_opcodes_h_l317_c3_fd8b : entity work.printf_uxn_opcodes_h_l317_c3_fd8b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l317_c3_fd8b_uxn_opcodes_h_l317_c3_fd8b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3
BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_left,
BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_right,
BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_return_output);

-- t8_MUX_uxn_opcodes_h_l322_c7_9abd
t8_MUX_uxn_opcodes_h_l322_c7_9abd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l322_c7_9abd_cond,
t8_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue,
t8_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse,
t8_MUX_uxn_opcodes_h_l322_c7_9abd_return_output);

-- n8_MUX_uxn_opcodes_h_l322_c7_9abd
n8_MUX_uxn_opcodes_h_l322_c7_9abd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l322_c7_9abd_cond,
n8_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue,
n8_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse,
n8_MUX_uxn_opcodes_h_l322_c7_9abd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd
result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd
result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd
result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_cond,
result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd
result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd
result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd
result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d
BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_left,
BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_right,
BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_return_output);

-- t8_MUX_uxn_opcodes_h_l325_c7_42c3
t8_MUX_uxn_opcodes_h_l325_c7_42c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l325_c7_42c3_cond,
t8_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue,
t8_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse,
t8_MUX_uxn_opcodes_h_l325_c7_42c3_return_output);

-- n8_MUX_uxn_opcodes_h_l325_c7_42c3
n8_MUX_uxn_opcodes_h_l325_c7_42c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l325_c7_42c3_cond,
n8_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue,
n8_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse,
n8_MUX_uxn_opcodes_h_l325_c7_42c3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3
result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3
result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_cond,
result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3
result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3
result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3
result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b
BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_left,
BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_right,
BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_return_output);

-- n8_MUX_uxn_opcodes_h_l329_c7_d551
n8_MUX_uxn_opcodes_h_l329_c7_d551 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l329_c7_d551_cond,
n8_MUX_uxn_opcodes_h_l329_c7_d551_iftrue,
n8_MUX_uxn_opcodes_h_l329_c7_d551_iffalse,
n8_MUX_uxn_opcodes_h_l329_c7_d551_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551
result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551
result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_cond,
result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551
result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6
BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_left,
BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_right,
BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_return_output);

-- n8_MUX_uxn_opcodes_h_l332_c7_feb8
n8_MUX_uxn_opcodes_h_l332_c7_feb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l332_c7_feb8_cond,
n8_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue,
n8_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse,
n8_MUX_uxn_opcodes_h_l332_c7_feb8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8
result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8
result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8
result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_cond,
result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8
result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8
BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_left,
BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_right,
BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d
BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_left,
BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_right,
BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_return_output);

-- MUX_uxn_opcodes_h_l336_c32_9bbe
MUX_uxn_opcodes_h_l336_c32_9bbe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l336_c32_9bbe_cond,
MUX_uxn_opcodes_h_l336_c32_9bbe_iftrue,
MUX_uxn_opcodes_h_l336_c32_9bbe_iffalse,
MUX_uxn_opcodes_h_l336_c32_9bbe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce
BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_left,
BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_right,
BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3
result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3
result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_cond,
result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3
result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3
result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c
BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_left,
BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_right,
BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b
result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b
result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_cond,
result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b
result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3
BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_left,
BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_right,
BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a
result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a
result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_cond,
result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a
result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b
BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_return_output,
 t8_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output,
 n8_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_return_output,
 t8_MUX_uxn_opcodes_h_l322_c7_9abd_return_output,
 n8_MUX_uxn_opcodes_h_l322_c7_9abd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_return_output,
 t8_MUX_uxn_opcodes_h_l325_c7_42c3_return_output,
 n8_MUX_uxn_opcodes_h_l325_c7_42c3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_return_output,
 n8_MUX_uxn_opcodes_h_l329_c7_d551_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_return_output,
 n8_MUX_uxn_opcodes_h_l332_c7_feb8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_return_output,
 MUX_uxn_opcodes_h_l336_c32_9bbe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l319_c3_99f3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l317_c3_fd8b_uxn_opcodes_h_l317_c3_fd8b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l323_c3_e45e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l329_c7_d551_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l327_c3_9187 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l329_c7_d551_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l329_c7_d551_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l332_c7_feb8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l329_c7_d551_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_7c71 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l332_c7_feb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l336_c32_9bbe_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l336_c32_9bbe_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l336_c32_9bbe_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l336_c32_9bbe_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l341_c3_36a6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l345_c3_1120 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_c49b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l329_l332_l322_l325_l316_DUPLICATE_6c18_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l329_l348_l332_l322_l325_l316_DUPLICATE_0e85_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l329_l322_l338_l325_l316_DUPLICATE_1b1b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l325_l316_l344_DUPLICATE_eabe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l332_l325_l322_l329_DUPLICATE_0011_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l338_l325_l344_DUPLICATE_e3b6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l348_l332_DUPLICATE_955d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l312_l357_DUPLICATE_3783_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l341_c3_36a6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l341_c3_36a6;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l323_c3_e45e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l323_c3_e45e;
     VAR_BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_7c71 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_7c71;
     VAR_MUX_uxn_opcodes_h_l336_c32_9bbe_iftrue := signed(std_logic_vector(resize(to_unsigned(3, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l345_c3_1120 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l345_c3_1120;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l336_c32_9bbe_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_right := to_unsigned(7, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_c49b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_c49b;
     VAR_BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l319_c3_99f3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l319_c3_99f3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l327_c3_9187 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l327_c3_9187;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l329_c7_d551_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l348_c11_c4d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l348_l332_DUPLICATE_955d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l348_l332_DUPLICATE_955d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_b55b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l338_l325_l344_DUPLICATE_e3b6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l338_l325_l344_DUPLICATE_e3b6_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l325_c11_389d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_left;
     BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_return_output := BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l329_l322_l338_l325_l316_DUPLICATE_1b1b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l329_l322_l338_l325_l316_DUPLICATE_1b1b_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l336_c32_89f8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_left;
     BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_return_output := BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l344_c11_2d8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_left;
     BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_return_output := BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l325_l316_l344_DUPLICATE_eabe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l325_l316_l344_DUPLICATE_eabe_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l329_l348_l332_l322_l325_l316_DUPLICATE_0e85 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l329_l348_l332_l322_l325_l316_DUPLICATE_0e85_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l329_c11_b88b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_left;
     BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_return_output := BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l332_l325_l322_l329_DUPLICATE_0011 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l332_l325_l322_l329_DUPLICATE_0011_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l329_l332_l322_l325_l316_DUPLICATE_6c18 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l329_l332_l322_l325_l316_DUPLICATE_6c18_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l332_c11_afe6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_left;
     BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_return_output := BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l316_c6_d1f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l322_c11_18a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l338_c11_99ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l336_c32_89f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l316_c2_bd1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l316_c2_bd1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c6_d1f6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l322_c7_9abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l322_c7_9abd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_18a3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l325_c7_42c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l325_c7_42c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l325_c11_389d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l329_c7_d551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_b88b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l332_c7_feb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_afe6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l338_c11_99ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_2d8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c11_c4d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b55b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l329_l332_l322_l325_l316_DUPLICATE_6c18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l329_l332_l322_l325_l316_DUPLICATE_6c18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l329_l332_l322_l325_l316_DUPLICATE_6c18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l329_l332_l322_l325_l316_DUPLICATE_6c18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l329_l332_l322_l325_l316_DUPLICATE_6c18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l338_l325_l344_DUPLICATE_e3b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l338_l325_l344_DUPLICATE_e3b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l338_l325_l344_DUPLICATE_e3b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l338_l325_l344_DUPLICATE_e3b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l338_l325_l344_DUPLICATE_e3b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l338_l325_l344_DUPLICATE_e3b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l338_l325_l344_DUPLICATE_e3b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l338_l325_l344_DUPLICATE_e3b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l329_l322_l338_l325_l316_DUPLICATE_1b1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l329_l322_l338_l325_l316_DUPLICATE_1b1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l329_l322_l338_l325_l316_DUPLICATE_1b1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l329_l322_l338_l325_l316_DUPLICATE_1b1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l329_l322_l338_l325_l316_DUPLICATE_1b1b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l332_l325_l322_l329_DUPLICATE_0011_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l332_l325_l322_l329_DUPLICATE_0011_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l332_l325_l322_l329_DUPLICATE_0011_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l332_l325_l322_l329_DUPLICATE_0011_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l325_l316_l344_DUPLICATE_eabe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l325_l316_l344_DUPLICATE_eabe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l325_l316_l344_DUPLICATE_eabe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l325_l316_l344_DUPLICATE_eabe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l325_l316_l344_DUPLICATE_eabe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l325_l316_l344_DUPLICATE_eabe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l325_l316_l344_DUPLICATE_eabe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l348_l332_l322_l352_l325_l316_l344_DUPLICATE_eabe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l348_l332_DUPLICATE_955d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l348_l332_DUPLICATE_955d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l329_l348_l332_l322_l325_l316_DUPLICATE_0e85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l329_l348_l332_l322_l325_l316_DUPLICATE_0e85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l329_l348_l332_l322_l325_l316_DUPLICATE_0e85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l329_l348_l332_l322_l325_l316_DUPLICATE_0e85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l329_l348_l332_l322_l325_l316_DUPLICATE_0e85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l329_l348_l332_l322_l325_l316_DUPLICATE_0e85_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l336_c32_f08d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_left;
     BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_return_output := BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l316_c1_e09d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l332_c7_feb8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l338_c7_fcb3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l348_c7_526a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_return_output := result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_return_output;

     -- t8_MUX[uxn_opcodes_h_l325_c7_42c3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l325_c7_42c3_cond <= VAR_t8_MUX_uxn_opcodes_h_l325_c7_42c3_cond;
     t8_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue;
     t8_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l325_c7_42c3_return_output := t8_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l348_c7_526a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_ef47] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_return_output;

     -- n8_MUX[uxn_opcodes_h_l332_c7_feb8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l332_c7_feb8_cond <= VAR_n8_MUX_uxn_opcodes_h_l332_c7_feb8_cond;
     n8_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue;
     n8_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l332_c7_feb8_return_output := n8_MUX_uxn_opcodes_h_l332_c7_feb8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_ef47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l336_c32_9bbe_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l336_c32_f08d_return_output;
     VAR_printf_uxn_opcodes_h_l317_c3_fd8b_uxn_opcodes_h_l317_c3_fd8b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l316_c1_e09d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l329_c7_d551_iffalse := VAR_n8_MUX_uxn_opcodes_h_l332_c7_feb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_ef47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l332_c7_feb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_ef47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c7_526a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c7_526a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;
     -- t8_MUX[uxn_opcodes_h_l322_c7_9abd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l322_c7_9abd_cond <= VAR_t8_MUX_uxn_opcodes_h_l322_c7_9abd_cond;
     t8_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue;
     t8_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l322_c7_9abd_return_output := t8_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;

     -- n8_MUX[uxn_opcodes_h_l329_c7_d551] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l329_c7_d551_cond <= VAR_n8_MUX_uxn_opcodes_h_l329_c7_d551_cond;
     n8_MUX_uxn_opcodes_h_l329_c7_d551_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l329_c7_d551_iftrue;
     n8_MUX_uxn_opcodes_h_l329_c7_d551_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l329_c7_d551_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l329_c7_d551_return_output := n8_MUX_uxn_opcodes_h_l329_c7_d551_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l332_c7_feb8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l348_c7_526a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l329_c7_d551] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l344_c7_4b5b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output := result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output;

     -- MUX[uxn_opcodes_h_l336_c32_9bbe] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l336_c32_9bbe_cond <= VAR_MUX_uxn_opcodes_h_l336_c32_9bbe_cond;
     MUX_uxn_opcodes_h_l336_c32_9bbe_iftrue <= VAR_MUX_uxn_opcodes_h_l336_c32_9bbe_iftrue;
     MUX_uxn_opcodes_h_l336_c32_9bbe_iffalse <= VAR_MUX_uxn_opcodes_h_l336_c32_9bbe_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l336_c32_9bbe_return_output := MUX_uxn_opcodes_h_l336_c32_9bbe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l348_c7_526a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l344_c7_4b5b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output;

     -- printf_uxn_opcodes_h_l317_c3_fd8b[uxn_opcodes_h_l317_c3_fd8b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l317_c3_fd8b_uxn_opcodes_h_l317_c3_fd8b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l317_c3_fd8b_uxn_opcodes_h_l317_c3_fd8b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue := VAR_MUX_uxn_opcodes_h_l336_c32_9bbe_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l329_c7_d551_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c7_526a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_feb8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_d551_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c7_526a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l344_c7_4b5b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output;

     -- t8_MUX[uxn_opcodes_h_l316_c2_bd1f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l316_c2_bd1f_cond <= VAR_t8_MUX_uxn_opcodes_h_l316_c2_bd1f_cond;
     t8_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue;
     t8_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output := t8_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l332_c7_feb8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l344_c7_4b5b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l329_c7_d551] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l338_c7_fcb3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output := result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l325_c7_42c3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l338_c7_fcb3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output;

     -- n8_MUX[uxn_opcodes_h_l325_c7_42c3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l325_c7_42c3_cond <= VAR_n8_MUX_uxn_opcodes_h_l325_c7_42c3_cond;
     n8_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue;
     n8_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l325_c7_42c3_return_output := n8_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_d551_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_4b5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_feb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l329_c7_d551] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l338_c7_fcb3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l332_c7_feb8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_return_output := result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l338_c7_fcb3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l322_c7_9abd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l325_c7_42c3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;

     -- n8_MUX[uxn_opcodes_h_l322_c7_9abd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l322_c7_9abd_cond <= VAR_n8_MUX_uxn_opcodes_h_l322_c7_9abd_cond;
     n8_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue;
     n8_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l322_c7_9abd_return_output := n8_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l332_c7_feb8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l338_c7_fcb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_d551_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_feb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_feb8_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l329_c7_d551] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_cond;
     result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_return_output := result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l332_c7_feb8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l332_c7_feb8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l329_c7_d551] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l316_c2_bd1f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l322_c7_9abd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l325_c7_42c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;

     -- n8_MUX[uxn_opcodes_h_l316_c2_bd1f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l316_c2_bd1f_cond <= VAR_n8_MUX_uxn_opcodes_h_l316_c2_bd1f_cond;
     n8_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue;
     n8_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output := n8_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_feb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_feb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_d551_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_d551_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l322_c7_9abd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l325_c7_42c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l316_c2_bd1f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l325_c7_42c3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_return_output := result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l329_c7_d551] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l329_c7_d551] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_d551_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_d551_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l325_c7_42c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l316_c2_bd1f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l322_c7_9abd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_return_output := result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l322_c7_9abd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l325_c7_42c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l325_c7_42c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l316_c2_bd1f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output := result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l322_c7_9abd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l316_c2_bd1f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l322_c7_9abd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_9abd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l316_c2_bd1f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l316_c2_bd1f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l312_l357_DUPLICATE_3783 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l312_l357_DUPLICATE_3783_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c2_bd1f_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l312_l357_DUPLICATE_3783_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l312_l357_DUPLICATE_3783_return_output;
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
