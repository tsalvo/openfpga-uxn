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
-- Submodules: 65
entity lth_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth_0CLK_7c2e709f;
architecture arch of lth_0CLK_7c2e709f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2196_c6_983f]
signal BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2196_c1_919d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2196_c2_8ceb]
signal t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2196_c2_8ceb]
signal n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2196_c2_8ceb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2196_c2_8ceb]
signal result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2196_c2_8ceb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2196_c2_8ceb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2196_c2_8ceb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2196_c2_8ceb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2196_c2_8ceb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2197_c3_90f1[uxn_opcodes_h_l2197_c3_90f1]
signal printf_uxn_opcodes_h_l2197_c3_90f1_uxn_opcodes_h_l2197_c3_90f1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2202_c11_8d03]
signal BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2202_c7_335b]
signal t8_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2202_c7_335b]
signal n8_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2202_c7_335b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2202_c7_335b]
signal result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2202_c7_335b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2202_c7_335b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2202_c7_335b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2202_c7_335b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2202_c7_335b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2205_c11_6690]
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2205_c7_c66d]
signal t8_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2205_c7_c66d]
signal n8_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2205_c7_c66d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2205_c7_c66d]
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2205_c7_c66d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2205_c7_c66d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2205_c7_c66d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2205_c7_c66d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2205_c7_c66d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2209_c11_f84e]
signal BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2209_c7_cea8]
signal n8_MUX_uxn_opcodes_h_l2209_c7_cea8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2209_c7_cea8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2209_c7_cea8]
signal result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2209_c7_cea8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2209_c7_cea8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2209_c7_cea8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2209_c7_cea8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2209_c7_cea8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2212_c11_4f27]
signal BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2212_c7_8e70]
signal n8_MUX_uxn_opcodes_h_l2212_c7_8e70_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2212_c7_8e70]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2212_c7_8e70]
signal result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2212_c7_8e70]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2212_c7_8e70]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2212_c7_8e70]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2212_c7_8e70]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2212_c7_8e70]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2216_c32_616f]
signal BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2216_c32_6097]
signal BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2216_c32_9460]
signal MUX_uxn_opcodes_h_l2216_c32_9460_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2216_c32_9460_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2216_c32_9460_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2216_c32_9460_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2218_c11_bb74]
signal BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2218_c7_d0c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2218_c7_d0c5]
signal result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2218_c7_d0c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2218_c7_d0c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2218_c7_d0c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l2222_c24_a507]
signal BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_right : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2222_c24_0a3e]
signal MUX_uxn_opcodes_h_l2222_c24_0a3e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2222_c24_0a3e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2222_c24_0a3e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2222_c24_0a3e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2224_c11_bbae]
signal BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2224_c7_4a76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2224_c7_4a76]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f
BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_left,
BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_right,
BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_return_output);

-- t8_MUX_uxn_opcodes_h_l2196_c2_8ceb
t8_MUX_uxn_opcodes_h_l2196_c2_8ceb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond,
t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue,
t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse,
t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output);

-- n8_MUX_uxn_opcodes_h_l2196_c2_8ceb
n8_MUX_uxn_opcodes_h_l2196_c2_8ceb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond,
n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue,
n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse,
n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb
result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb
result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb
result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output);

-- printf_uxn_opcodes_h_l2197_c3_90f1_uxn_opcodes_h_l2197_c3_90f1
printf_uxn_opcodes_h_l2197_c3_90f1_uxn_opcodes_h_l2197_c3_90f1 : entity work.printf_uxn_opcodes_h_l2197_c3_90f1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2197_c3_90f1_uxn_opcodes_h_l2197_c3_90f1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03
BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_left,
BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_right,
BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_return_output);

-- t8_MUX_uxn_opcodes_h_l2202_c7_335b
t8_MUX_uxn_opcodes_h_l2202_c7_335b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2202_c7_335b_cond,
t8_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue,
t8_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse,
t8_MUX_uxn_opcodes_h_l2202_c7_335b_return_output);

-- n8_MUX_uxn_opcodes_h_l2202_c7_335b
n8_MUX_uxn_opcodes_h_l2202_c7_335b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2202_c7_335b_cond,
n8_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue,
n8_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse,
n8_MUX_uxn_opcodes_h_l2202_c7_335b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b
result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b
result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b
result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b
result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b
result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_left,
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_right,
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_return_output);

-- t8_MUX_uxn_opcodes_h_l2205_c7_c66d
t8_MUX_uxn_opcodes_h_l2205_c7_c66d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2205_c7_c66d_cond,
t8_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue,
t8_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse,
t8_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output);

-- n8_MUX_uxn_opcodes_h_l2205_c7_c66d
n8_MUX_uxn_opcodes_h_l2205_c7_c66d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2205_c7_c66d_cond,
n8_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue,
n8_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse,
n8_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d
result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e
BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_left,
BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_right,
BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_return_output);

-- n8_MUX_uxn_opcodes_h_l2209_c7_cea8
n8_MUX_uxn_opcodes_h_l2209_c7_cea8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2209_c7_cea8_cond,
n8_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue,
n8_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse,
n8_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8
result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8
result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8
result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8
result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8
result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27
BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_left,
BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_right,
BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_return_output);

-- n8_MUX_uxn_opcodes_h_l2212_c7_8e70
n8_MUX_uxn_opcodes_h_l2212_c7_8e70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2212_c7_8e70_cond,
n8_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue,
n8_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse,
n8_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70
result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70
result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_cond,
result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70
result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70
result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70
result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70
result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f
BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_left,
BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_right,
BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097
BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_left,
BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_right,
BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_return_output);

-- MUX_uxn_opcodes_h_l2216_c32_9460
MUX_uxn_opcodes_h_l2216_c32_9460 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2216_c32_9460_cond,
MUX_uxn_opcodes_h_l2216_c32_9460_iftrue,
MUX_uxn_opcodes_h_l2216_c32_9460_iffalse,
MUX_uxn_opcodes_h_l2216_c32_9460_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_left,
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_right,
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5
result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5
result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507
BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507 : entity work.BIN_OP_LT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_left,
BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_right,
BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_return_output);

-- MUX_uxn_opcodes_h_l2222_c24_0a3e
MUX_uxn_opcodes_h_l2222_c24_0a3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2222_c24_0a3e_cond,
MUX_uxn_opcodes_h_l2222_c24_0a3e_iftrue,
MUX_uxn_opcodes_h_l2222_c24_0a3e_iffalse,
MUX_uxn_opcodes_h_l2222_c24_0a3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae
BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_left,
BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_right,
BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_return_output,
 t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output,
 n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_return_output,
 t8_MUX_uxn_opcodes_h_l2202_c7_335b_return_output,
 n8_MUX_uxn_opcodes_h_l2202_c7_335b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_return_output,
 t8_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output,
 n8_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_return_output,
 n8_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_return_output,
 n8_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_return_output,
 MUX_uxn_opcodes_h_l2216_c32_9460_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output,
 BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_return_output,
 MUX_uxn_opcodes_h_l2222_c24_0a3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2199_c3_8e20 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2197_c3_90f1_uxn_opcodes_h_l2197_c3_90f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2203_c3_999a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2207_c3_5b8a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2209_c7_cea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2210_c3_83b8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2212_c7_8e70_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2216_c32_9460_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2216_c32_9460_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2216_c32_9460_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2216_c32_9460_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2221_c3_05be : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2222_c24_0a3e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2222_c24_0a3e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2222_c24_0a3e_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2222_c24_0a3e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2218_DUPLICATE_3504_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2218_l2212_DUPLICATE_152d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2224_l2212_DUPLICATE_5ebb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2212_DUPLICATE_4834_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2224_l2218_l2212_DUPLICATE_b15e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2205_l2209_l2202_l2212_DUPLICATE_0459_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2218_l2212_DUPLICATE_23ea_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2192_l2229_DUPLICATE_d5ee_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l2222_c24_0a3e_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l2222_c24_0a3e_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2203_c3_999a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2203_c3_999a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2207_c3_5b8a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2207_c3_5b8a;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l2216_c32_9460_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2210_c3_83b8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2210_c3_83b8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2199_c3_8e20 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2199_c3_8e20;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2221_c3_05be := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2221_c3_05be;
     VAR_MUX_uxn_opcodes_h_l2216_c32_9460_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2209_c11_f84e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2218_l2212_DUPLICATE_23ea LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2218_l2212_DUPLICATE_23ea_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2205_c11_6690] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_left;
     BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_return_output := BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2218_c11_bb74] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_left;
     BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_return_output := BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2205_l2209_l2202_l2212_DUPLICATE_0459 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2205_l2209_l2202_l2212_DUPLICATE_0459_return_output := result.is_stack_read;

     -- BIN_OP_LT[uxn_opcodes_h_l2222_c24_a507] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_left;
     BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_return_output := BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2212_c11_4f27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_left;
     BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_return_output := BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2202_c11_8d03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_left;
     BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_return_output := BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2224_l2212_DUPLICATE_5ebb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2224_l2212_DUPLICATE_5ebb_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l2216_c32_616f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_left;
     BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_return_output := BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2212_DUPLICATE_4834 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2212_DUPLICATE_4834_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2218_DUPLICATE_3504 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2218_DUPLICATE_3504_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2218_l2212_DUPLICATE_152d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2218_l2212_DUPLICATE_152d_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2224_c11_bbae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2196_c6_983f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2224_l2218_l2212_DUPLICATE_b15e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2224_l2218_l2212_DUPLICATE_b15e_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2216_c32_616f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c6_983f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2202_c7_335b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2202_c7_335b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2202_c11_8d03_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2205_c7_c66d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2205_c7_c66d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_6690_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2209_c7_cea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2209_c11_f84e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2212_c7_8e70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_4f27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_bb74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_bbae_return_output;
     VAR_MUX_uxn_opcodes_h_l2222_c24_0a3e_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l2222_c24_a507_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2212_DUPLICATE_4834_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2212_DUPLICATE_4834_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2212_DUPLICATE_4834_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2212_DUPLICATE_4834_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2212_DUPLICATE_4834_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2224_l2218_l2212_DUPLICATE_b15e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2224_l2218_l2212_DUPLICATE_b15e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2224_l2218_l2212_DUPLICATE_b15e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2224_l2218_l2212_DUPLICATE_b15e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2224_l2218_l2212_DUPLICATE_b15e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2224_l2218_l2212_DUPLICATE_b15e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2218_DUPLICATE_3504_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2218_DUPLICATE_3504_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2218_DUPLICATE_3504_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2218_DUPLICATE_3504_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2218_DUPLICATE_3504_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2205_l2209_l2202_l2212_DUPLICATE_0459_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2205_l2209_l2202_l2212_DUPLICATE_0459_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2205_l2209_l2202_l2212_DUPLICATE_0459_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2205_l2209_l2202_l2212_DUPLICATE_0459_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2224_l2212_DUPLICATE_5ebb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2224_l2212_DUPLICATE_5ebb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2224_l2212_DUPLICATE_5ebb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2224_l2212_DUPLICATE_5ebb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2224_l2212_DUPLICATE_5ebb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2224_l2212_DUPLICATE_5ebb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2218_l2212_DUPLICATE_23ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2218_l2212_DUPLICATE_23ea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2218_l2212_DUPLICATE_152d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2218_l2212_DUPLICATE_152d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2218_l2212_DUPLICATE_152d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2218_l2212_DUPLICATE_152d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2218_l2212_DUPLICATE_152d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2209_l2205_l2202_l2196_l2218_l2212_DUPLICATE_152d_return_output;
     -- n8_MUX[uxn_opcodes_h_l2212_c7_8e70] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2212_c7_8e70_cond <= VAR_n8_MUX_uxn_opcodes_h_l2212_c7_8e70_cond;
     n8_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue;
     n8_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output := n8_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output;

     -- t8_MUX[uxn_opcodes_h_l2205_c7_c66d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2205_c7_c66d_cond <= VAR_t8_MUX_uxn_opcodes_h_l2205_c7_c66d_cond;
     t8_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue;
     t8_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output := t8_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2212_c7_8e70] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2224_c7_4a76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2216_c32_6097] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_left;
     BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_return_output := BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_return_output;

     -- MUX[uxn_opcodes_h_l2222_c24_0a3e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2222_c24_0a3e_cond <= VAR_MUX_uxn_opcodes_h_l2222_c24_0a3e_cond;
     MUX_uxn_opcodes_h_l2222_c24_0a3e_iftrue <= VAR_MUX_uxn_opcodes_h_l2222_c24_0a3e_iftrue;
     MUX_uxn_opcodes_h_l2222_c24_0a3e_iffalse <= VAR_MUX_uxn_opcodes_h_l2222_c24_0a3e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2222_c24_0a3e_return_output := MUX_uxn_opcodes_h_l2222_c24_0a3e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2224_c7_4a76] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2196_c1_919d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2218_c7_d0c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2218_c7_d0c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2216_c32_9460_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2216_c32_6097_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue := VAR_MUX_uxn_opcodes_h_l2222_c24_0a3e_return_output;
     VAR_printf_uxn_opcodes_h_l2197_c3_90f1_uxn_opcodes_h_l2197_c3_90f1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2196_c1_919d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_4a76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_4a76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2218_c7_d0c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output;

     -- t8_MUX[uxn_opcodes_h_l2202_c7_335b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2202_c7_335b_cond <= VAR_t8_MUX_uxn_opcodes_h_l2202_c7_335b_cond;
     t8_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue;
     t8_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2202_c7_335b_return_output := t8_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2212_c7_8e70] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output;

     -- n8_MUX[uxn_opcodes_h_l2209_c7_cea8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2209_c7_cea8_cond <= VAR_n8_MUX_uxn_opcodes_h_l2209_c7_cea8_cond;
     n8_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue;
     n8_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output := n8_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2218_c7_d0c5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2209_c7_cea8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output;

     -- MUX[uxn_opcodes_h_l2216_c32_9460] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2216_c32_9460_cond <= VAR_MUX_uxn_opcodes_h_l2216_c32_9460_cond;
     MUX_uxn_opcodes_h_l2216_c32_9460_iftrue <= VAR_MUX_uxn_opcodes_h_l2216_c32_9460_iftrue;
     MUX_uxn_opcodes_h_l2216_c32_9460_iffalse <= VAR_MUX_uxn_opcodes_h_l2216_c32_9460_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2216_c32_9460_return_output := MUX_uxn_opcodes_h_l2216_c32_9460_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2212_c7_8e70] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output;

     -- printf_uxn_opcodes_h_l2197_c3_90f1[uxn_opcodes_h_l2197_c3_90f1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2197_c3_90f1_uxn_opcodes_h_l2197_c3_90f1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2197_c3_90f1_uxn_opcodes_h_l2197_c3_90f1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2218_c7_d0c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue := VAR_MUX_uxn_opcodes_h_l2216_c32_9460_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2218_c7_d0c5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2212_c7_8e70] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2212_c7_8e70] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output;

     -- n8_MUX[uxn_opcodes_h_l2205_c7_c66d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2205_c7_c66d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2205_c7_c66d_cond;
     n8_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue;
     n8_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output := n8_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2209_c7_cea8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2205_c7_c66d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2209_c7_cea8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2212_c7_8e70] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output;

     -- t8_MUX[uxn_opcodes_h_l2196_c2_8ceb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond <= VAR_t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond;
     t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue;
     t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output := t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2212_c7_8e70] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output := result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_8e70_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2209_c7_cea8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2205_c7_c66d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2202_c7_335b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2202_c7_335b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2202_c7_335b_cond;
     n8_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue;
     n8_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2202_c7_335b_return_output := n8_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2209_c7_cea8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2205_c7_c66d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2202_c7_335b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2209_c7_cea8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2209_c7_cea8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2209_c7_cea8_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2196_c2_8ceb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2202_c7_335b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2205_c7_c66d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2205_c7_c66d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2205_c7_c66d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2202_c7_335b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2205_c7_c66d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2196_c2_8ceb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond <= VAR_n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond;
     n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue;
     n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output := n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_c66d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2202_c7_335b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2202_c7_335b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2196_c2_8ceb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2196_c2_8ceb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2202_c7_335b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2202_c7_335b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2202_c7_335b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2196_c2_8ceb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2196_c2_8ceb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2196_c2_8ceb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2196_c2_8ceb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2192_l2229_DUPLICATE_d5ee LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2192_l2229_DUPLICATE_d5ee_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c2_8ceb_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2192_l2229_DUPLICATE_d5ee_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2192_l2229_DUPLICATE_d5ee_return_output;
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
