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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 112
entity eor2_0CLK_c89b169c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_c89b169c;
architecture arch of eor2_0CLK_c89b169c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1194_c6_25e9]
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1194_c2_ff8f]
signal t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1194_c2_ff8f]
signal tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1194_c2_ff8f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1194_c2_ff8f]
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1194_c2_ff8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1194_c2_ff8f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1194_c2_ff8f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1194_c2_ff8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1194_c2_ff8f]
signal n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1199_c11_565f]
signal BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1199_c7_bc0e]
signal t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1199_c7_bc0e]
signal tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1199_c7_bc0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1199_c7_bc0e]
signal result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1199_c7_bc0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1199_c7_bc0e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1199_c7_bc0e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1199_c7_bc0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1199_c7_bc0e]
signal n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1202_c11_9489]
signal BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1202_c7_2f2a]
signal t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1202_c7_2f2a]
signal tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1202_c7_2f2a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1202_c7_2f2a]
signal result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1202_c7_2f2a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1202_c7_2f2a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1202_c7_2f2a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1202_c7_2f2a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1202_c7_2f2a]
signal n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1207_c11_9e85]
signal BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1207_c7_7c94]
signal t16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1207_c7_7c94]
signal tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1207_c7_7c94]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1207_c7_7c94]
signal result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1207_c7_7c94]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1207_c7_7c94]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1207_c7_7c94]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1207_c7_7c94]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1207_c7_7c94]
signal n16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_ac34]
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1210_c7_cca4]
signal t16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1210_c7_cca4]
signal tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_cca4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1210_c7_cca4]
signal result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_cca4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1210_c7_cca4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_cca4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_cca4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1210_c7_cca4]
signal n16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1211_c3_a86d]
signal BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_c8cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1214_c7_eab3]
signal tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c7_eab3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1214_c7_eab3]
signal result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c7_eab3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1214_c7_eab3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_eab3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_eab3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1214_c7_eab3]
signal n16_MUX_uxn_opcodes_h_l1214_c7_eab3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1217_c11_48d2]
signal BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1217_c7_a2ae]
signal tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1217_c7_a2ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1217_c7_a2ae]
signal result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1217_c7_a2ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1217_c7_a2ae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1217_c7_a2ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1217_c7_a2ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1217_c7_a2ae]
signal n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_5e8d]
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1222_c7_3a99]
signal tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_3a99]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1222_c7_3a99]
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_3a99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1222_c7_3a99]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_3a99]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_3a99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1222_c7_3a99]
signal n16_MUX_uxn_opcodes_h_l1222_c7_3a99_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1225_c11_682a]
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1225_c7_b0c6]
signal tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1225_c7_b0c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1225_c7_b0c6]
signal result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1225_c7_b0c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1225_c7_b0c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1225_c7_b0c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1225_c7_b0c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1225_c7_b0c6]
signal n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1226_c3_99d5]
signal BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1227_c11_99fa]
signal BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1229_c32_12a8]
signal BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1229_c32_d04f]
signal BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1229_c32_1d39]
signal MUX_uxn_opcodes_h_l1229_c32_1d39_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1229_c32_1d39_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1229_c32_1d39_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1229_c32_1d39_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1231_c11_13d8]
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1231_c7_707a]
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1231_c7_707a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1231_c7_707a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1231_c7_707a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1231_c7_707a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1237_c11_cbbc]
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1237_c7_ea6a]
signal result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1237_c7_ea6a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1237_c7_ea6a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1237_c7_ea6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1239_c34_ca20]
signal CONST_SR_8_uxn_opcodes_h_l1239_c34_ca20_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1239_c34_ca20_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_c355]
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_ccf0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_ccf0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9
BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_left,
BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_right,
BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_return_output);

-- t16_MUX_uxn_opcodes_h_l1194_c2_ff8f
t16_MUX_uxn_opcodes_h_l1194_c2_ff8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond,
t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue,
t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse,
t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f
tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond,
tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f
result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output);

-- n16_MUX_uxn_opcodes_h_l1194_c2_ff8f
n16_MUX_uxn_opcodes_h_l1194_c2_ff8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond,
n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue,
n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse,
n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f
BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_left,
BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_right,
BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_return_output);

-- t16_MUX_uxn_opcodes_h_l1199_c7_bc0e
t16_MUX_uxn_opcodes_h_l1199_c7_bc0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond,
t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue,
t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse,
t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e
tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond,
tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e
result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e
result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e
result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e
result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output);

-- n16_MUX_uxn_opcodes_h_l1199_c7_bc0e
n16_MUX_uxn_opcodes_h_l1199_c7_bc0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond,
n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue,
n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse,
n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_left,
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_right,
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_return_output);

-- t16_MUX_uxn_opcodes_h_l1202_c7_2f2a
t16_MUX_uxn_opcodes_h_l1202_c7_2f2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond,
t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue,
t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse,
t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a
tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond,
tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output);

-- n16_MUX_uxn_opcodes_h_l1202_c7_2f2a
n16_MUX_uxn_opcodes_h_l1202_c7_2f2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond,
n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue,
n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse,
n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85
BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_left,
BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_right,
BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_return_output);

-- t16_MUX_uxn_opcodes_h_l1207_c7_7c94
t16_MUX_uxn_opcodes_h_l1207_c7_7c94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond,
t16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue,
t16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse,
t16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94
tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond,
tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue,
tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse,
tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94
result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94
result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_cond,
result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94
result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94
result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94
result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output);

-- n16_MUX_uxn_opcodes_h_l1207_c7_7c94
n16_MUX_uxn_opcodes_h_l1207_c7_7c94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond,
n16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue,
n16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse,
n16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_left,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_right,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_return_output);

-- t16_MUX_uxn_opcodes_h_l1210_c7_cca4
t16_MUX_uxn_opcodes_h_l1210_c7_cca4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond,
t16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue,
t16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse,
t16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4
tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond,
tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output);

-- n16_MUX_uxn_opcodes_h_l1210_c7_cca4
n16_MUX_uxn_opcodes_h_l1210_c7_cca4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond,
n16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue,
n16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse,
n16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d
BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_left,
BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_right,
BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3
tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_cond,
tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3
result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output);

-- n16_MUX_uxn_opcodes_h_l1214_c7_eab3
n16_MUX_uxn_opcodes_h_l1214_c7_eab3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1214_c7_eab3_cond,
n16_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue,
n16_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse,
n16_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_left,
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_right,
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae
tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond,
tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue,
tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse,
tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae
result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond,
result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output);

-- n16_MUX_uxn_opcodes_h_l1217_c7_a2ae
n16_MUX_uxn_opcodes_h_l1217_c7_a2ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond,
n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue,
n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse,
n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_left,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_right,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99
tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_cond,
tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue,
tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse,
tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_cond,
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output);

-- n16_MUX_uxn_opcodes_h_l1222_c7_3a99
n16_MUX_uxn_opcodes_h_l1222_c7_3a99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1222_c7_3a99_cond,
n16_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue,
n16_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse,
n16_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_left,
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_right,
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6
tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond,
tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6
result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output);

-- n16_MUX_uxn_opcodes_h_l1225_c7_b0c6
n16_MUX_uxn_opcodes_h_l1225_c7_b0c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond,
n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue,
n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse,
n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5
BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_left,
BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_right,
BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa
BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_left,
BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_right,
BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8
BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_left,
BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_right,
BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f
BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_left,
BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_right,
BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_return_output);

-- MUX_uxn_opcodes_h_l1229_c32_1d39
MUX_uxn_opcodes_h_l1229_c32_1d39 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1229_c32_1d39_cond,
MUX_uxn_opcodes_h_l1229_c32_1d39_iftrue,
MUX_uxn_opcodes_h_l1229_c32_1d39_iffalse,
MUX_uxn_opcodes_h_l1229_c32_1d39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_left,
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_right,
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_left,
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_right,
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a
result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1239_c34_ca20
CONST_SR_8_uxn_opcodes_h_l1239_c34_ca20 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1239_c34_ca20_x,
CONST_SR_8_uxn_opcodes_h_l1239_c34_ca20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_left,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_right,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1
CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_return_output,
 t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output,
 n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_return_output,
 t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output,
 n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_return_output,
 t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output,
 n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_return_output,
 t16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output,
 tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output,
 n16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_return_output,
 t16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output,
 n16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output,
 n16_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output,
 n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output,
 n16_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output,
 n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_return_output,
 MUX_uxn_opcodes_h_l1229_c32_1d39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output,
 CONST_SR_8_uxn_opcodes_h_l1239_c34_ca20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1196_c3_da5d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1200_c3_f26f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1205_c3_dbc3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_acce : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_2507 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1215_c3_4f85 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_eab3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_ce7a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1223_c3_ce08 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_3a99_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1229_c32_1d39_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1229_c32_1d39_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1229_c32_1d39_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1229_c32_1d39_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_499a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1235_c24_bc85_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1238_c3_efd0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1239_c34_ca20_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1239_c34_ca20_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1239_c24_ff3b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_b87f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_l1237_DUPLICATE_631a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_027d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_DUPLICATE_b48f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1225_l1199_l1222_l1217_l1214_l1241_l1210_l1237_DUPLICATE_e91a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1203_l1218_l1211_l1226_DUPLICATE_c06b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1225_l1237_DUPLICATE_b0bc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1246_l1190_DUPLICATE_0e9d_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_499a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_499a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1196_c3_da5d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1196_c3_da5d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_2507 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_2507;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1200_c3_f26f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1200_c3_f26f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_acce := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_acce;
     VAR_MUX_uxn_opcodes_h_l1229_c32_1d39_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1238_c3_efd0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1238_c3_efd0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_ce7a := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_ce7a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1215_c3_4f85 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1215_c3_4f85;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1205_c3_dbc3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1205_c3_dbc3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1223_c3_ce08 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1223_c3_ce08;
     VAR_MUX_uxn_opcodes_h_l1229_c32_1d39_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_right := to_unsigned(10, 4);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1239_c34_ca20_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1217_c11_48d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_ac34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_left;
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_return_output := BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_c355] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_left;
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_return_output := BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1199_c11_565f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1239_c34_ca20] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1239_c34_ca20_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1239_c34_ca20_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1239_c34_ca20_return_output := CONST_SR_8_uxn_opcodes_h_l1239_c34_ca20_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1194_c6_25e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1235_c24_bc85] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1235_c24_bc85_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1203_l1218_l1211_l1226_DUPLICATE_c06b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1203_l1218_l1211_l1226_DUPLICATE_c06b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_b87f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_b87f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1202_c11_9489] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_left;
     BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_return_output := BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1207_c11_9e85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_left;
     BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_return_output := BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_DUPLICATE_b48f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_DUPLICATE_b48f_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_5e8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_027d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_027d_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1225_l1237_DUPLICATE_b0bc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1225_l1237_DUPLICATE_b0bc_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1237_c11_cbbc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1231_c11_13d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1225_l1199_l1222_l1217_l1214_l1241_l1210_l1237_DUPLICATE_e91a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1225_l1199_l1222_l1217_l1214_l1241_l1210_l1237_DUPLICATE_e91a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_c8cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_l1237_DUPLICATE_631a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_l1237_DUPLICATE_631a_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l1229_c32_12a8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_left;
     BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_return_output := BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1225_c11_682a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_12a8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_25e9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_565f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_9489_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_9e85_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_ac34_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_eab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_c8cc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_48d2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_3a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_5e8d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_682a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_13d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_cbbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c355_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1203_l1218_l1211_l1226_DUPLICATE_c06b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1203_l1218_l1211_l1226_DUPLICATE_c06b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1203_l1218_l1211_l1226_DUPLICATE_c06b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1235_c24_bc85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_b87f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_b87f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_b87f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_b87f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_b87f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_b87f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_b87f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_b87f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_b87f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1225_l1199_l1222_l1217_l1214_l1241_l1210_l1237_DUPLICATE_e91a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1225_l1199_l1222_l1217_l1214_l1241_l1210_l1237_DUPLICATE_e91a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1225_l1199_l1222_l1217_l1214_l1241_l1210_l1237_DUPLICATE_e91a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1225_l1199_l1222_l1217_l1214_l1241_l1210_l1237_DUPLICATE_e91a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1225_l1199_l1222_l1217_l1214_l1241_l1210_l1237_DUPLICATE_e91a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1225_l1199_l1222_l1217_l1214_l1241_l1210_l1237_DUPLICATE_e91a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1225_l1199_l1222_l1217_l1214_l1241_l1210_l1237_DUPLICATE_e91a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1225_l1199_l1222_l1217_l1214_l1241_l1210_l1237_DUPLICATE_e91a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1225_l1199_l1222_l1217_l1214_l1241_l1210_l1237_DUPLICATE_e91a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1225_l1199_l1222_l1217_l1214_l1241_l1210_l1237_DUPLICATE_e91a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1225_l1199_l1222_l1217_l1214_l1241_l1210_l1237_DUPLICATE_e91a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_027d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_027d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_027d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_027d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_027d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_027d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_027d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_027d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1207_l1231_l1202_l1199_l1222_l1194_l1217_l1214_l1210_DUPLICATE_027d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_DUPLICATE_b48f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_DUPLICATE_b48f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_DUPLICATE_b48f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_DUPLICATE_b48f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_DUPLICATE_b48f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_DUPLICATE_b48f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_DUPLICATE_b48f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_DUPLICATE_b48f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_DUPLICATE_b48f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_DUPLICATE_b48f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_DUPLICATE_b48f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1225_l1237_DUPLICATE_b0bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1225_l1237_DUPLICATE_b0bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_l1237_DUPLICATE_631a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_l1237_DUPLICATE_631a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_l1237_DUPLICATE_631a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_l1237_DUPLICATE_631a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_l1237_DUPLICATE_631a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_l1237_DUPLICATE_631a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_l1237_DUPLICATE_631a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_l1237_DUPLICATE_631a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_l1237_DUPLICATE_631a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1207_l1202_l1225_l1199_l1222_l1194_l1217_l1214_l1210_l1237_DUPLICATE_631a_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1211_c3_a86d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_left;
     BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_return_output := BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1226_c3_99d5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_left;
     BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_return_output := BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1229_c32_d04f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_left;
     BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_return_output := BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1237_c7_ea6a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1239_c24_ff3b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1239_c24_ff3b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1239_c34_ca20_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_ccf0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1231_c7_707a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_ccf0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1229_c32_1d39_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_d04f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_a86d_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_99d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1239_c24_ff3b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_dbc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ccf0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_707a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ccf0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1237_c7_ea6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1237_c7_ea6a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1225_c7_b0c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1231_c7_707a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_return_output;

     -- MUX[uxn_opcodes_h_l1229_c32_1d39] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1229_c32_1d39_cond <= VAR_MUX_uxn_opcodes_h_l1229_c32_1d39_cond;
     MUX_uxn_opcodes_h_l1229_c32_1d39_iftrue <= VAR_MUX_uxn_opcodes_h_l1229_c32_1d39_iftrue;
     MUX_uxn_opcodes_h_l1229_c32_1d39_iffalse <= VAR_MUX_uxn_opcodes_h_l1229_c32_1d39_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1229_c32_1d39_return_output := MUX_uxn_opcodes_h_l1229_c32_1d39_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1237_c7_ea6a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1210_c7_cca4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond;
     t16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue;
     t16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output := t16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1227_c11_99fa] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_left;
     BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_return_output := BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_return_output;

     -- n16_MUX[uxn_opcodes_h_l1225_c7_b0c6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond;
     n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue;
     n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output := n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_99fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue := VAR_MUX_uxn_opcodes_h_l1229_c32_1d39_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_707a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_ea6a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1225_c7_b0c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1231_c7_707a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1207_c7_7c94] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond <= VAR_t16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond;
     t16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue;
     t16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output := t16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1222_c7_3a99] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1225_c7_b0c6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond;
     tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output := tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1231_c7_707a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1225_c7_b0c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1231_c7_707a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1222_c7_3a99] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1222_c7_3a99_cond <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_3a99_cond;
     n16_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue;
     n16_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output := n16_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_707a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_707a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_707a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1225_c7_b0c6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1225_c7_b0c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1217_c7_a2ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond;
     n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue;
     n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output := n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output;

     -- t16_MUX[uxn_opcodes_h_l1202_c7_2f2a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond;
     t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue;
     t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output := t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1222_c7_3a99] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_cond;
     tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output := tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1225_c7_b0c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_3a99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_3a99] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1217_c7_a2ae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_b0c6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_3a99] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1217_c7_a2ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_3a99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1217_c7_a2ae] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond;
     tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output := tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output;

     -- t16_MUX[uxn_opcodes_h_l1199_c7_bc0e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond;
     t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue;
     t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output := t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1222_c7_3a99] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output := result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output;

     -- n16_MUX[uxn_opcodes_h_l1214_c7_eab3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1214_c7_eab3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_eab3_cond;
     n16_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue;
     n16_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output := n16_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1217_c7_a2ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1214_c7_eab3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_3a99_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output;
     -- t16_MUX[uxn_opcodes_h_l1194_c2_ff8f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond;
     t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue;
     t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output := t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c7_eab3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1210_c7_cca4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond;
     n16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue;
     n16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output := n16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1214_c7_eab3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_cond;
     tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output := tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c7_eab3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1217_c7_a2ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1217_c7_a2ae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output := result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1217_c7_a2ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1210_c7_cca4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_a2ae_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_cca4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_eab3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1207_c7_7c94] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond <= VAR_n16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond;
     n16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue;
     n16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output := n16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_cca4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1210_c7_cca4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_cond;
     tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output := tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_eab3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1214_c7_eab3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1207_c7_7c94] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_eab3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_cca4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1202_c7_2f2a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1207_c7_7c94] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1210_c7_cca4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1202_c7_2f2a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond;
     n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue;
     n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output := n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_cca4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1207_c7_7c94] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1207_c7_7c94] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_cond;
     tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output := tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_cca4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1207_c7_7c94] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;

     -- n16_MUX[uxn_opcodes_h_l1199_c7_bc0e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond;
     n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue;
     n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output := n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1202_c7_2f2a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1207_c7_7c94] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1202_c7_2f2a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond;
     tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output := tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1202_c7_2f2a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1199_c7_bc0e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1207_c7_7c94] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output := result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_7c94_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1199_c7_bc0e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond;
     tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output := tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1199_c7_bc0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1202_c7_2f2a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1194_c2_ff8f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1199_c7_bc0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1202_c7_2f2a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1194_c2_ff8f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond;
     n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue;
     n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output := n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1202_c7_2f2a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_2f2a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1194_c2_ff8f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1194_c2_ff8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1199_c7_bc0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1199_c7_bc0e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1194_c2_ff8f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond;
     tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output := tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1199_c7_bc0e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_bc0e_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1194_c2_ff8f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1194_c2_ff8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1194_c2_ff8f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1246_l1190_DUPLICATE_0e9d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1246_l1190_DUPLICATE_0e9d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_ff8f_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1246_l1190_DUPLICATE_0e9d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1246_l1190_DUPLICATE_0e9d_return_output;
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
