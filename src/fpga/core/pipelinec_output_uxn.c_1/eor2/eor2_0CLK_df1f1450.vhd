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
-- Submodules: 114
entity eor2_0CLK_df1f1450 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_df1f1450;
architecture arch of eor2_0CLK_df1f1450 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1194_c6_0aa0]
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1194_c1_627e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1194_c2_f48d]
signal tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1194_c2_f48d]
signal t16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1194_c2_f48d]
signal n16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1194_c2_f48d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1194_c2_f48d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1194_c2_f48d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1194_c2_f48d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1194_c2_f48d]
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1194_c2_f48d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1195_c3_ae90[uxn_opcodes_h_l1195_c3_ae90]
signal printf_uxn_opcodes_h_l1195_c3_ae90_uxn_opcodes_h_l1195_c3_ae90_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1199_c11_3560]
signal BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1199_c7_7759]
signal tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1199_c7_7759]
signal t16_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1199_c7_7759]
signal n16_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1199_c7_7759]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1199_c7_7759]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1199_c7_7759]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1199_c7_7759]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1199_c7_7759]
signal result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1199_c7_7759]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1202_c11_698f]
signal BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1202_c7_fbb2]
signal tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1202_c7_fbb2]
signal t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1202_c7_fbb2]
signal n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1202_c7_fbb2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1202_c7_fbb2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1202_c7_fbb2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1202_c7_fbb2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1202_c7_fbb2]
signal result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1202_c7_fbb2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1207_c11_a0a9]
signal BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1207_c7_13f0]
signal tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1207_c7_13f0]
signal t16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1207_c7_13f0]
signal n16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1207_c7_13f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1207_c7_13f0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1207_c7_13f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1207_c7_13f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1207_c7_13f0]
signal result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1207_c7_13f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_7d0a]
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1210_c7_e1fc]
signal tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1210_c7_e1fc]
signal t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1210_c7_e1fc]
signal n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_e1fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1210_c7_e1fc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_e1fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_e1fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1210_c7_e1fc]
signal result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_e1fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1211_c3_af07]
signal BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_1143]
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1214_c7_3f59]
signal tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1214_c7_3f59]
signal n16_MUX_uxn_opcodes_h_l1214_c7_3f59_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_3f59]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1214_c7_3f59]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c7_3f59]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c7_3f59]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1214_c7_3f59]
signal result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_3f59]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1217_c11_b7c0]
signal BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1217_c7_38cc]
signal tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1217_c7_38cc]
signal n16_MUX_uxn_opcodes_h_l1217_c7_38cc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1217_c7_38cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1217_c7_38cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1217_c7_38cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1217_c7_38cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1217_c7_38cc]
signal result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1217_c7_38cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_1a9b]
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1222_c7_d77c]
signal tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1222_c7_d77c]
signal n16_MUX_uxn_opcodes_h_l1222_c7_d77c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_d77c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1222_c7_d77c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_d77c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_d77c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1222_c7_d77c]
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_d77c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1225_c11_e409]
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1225_c7_e452]
signal tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1225_c7_e452]
signal n16_MUX_uxn_opcodes_h_l1225_c7_e452_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_e452_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1225_c7_e452]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1225_c7_e452]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1225_c7_e452]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1225_c7_e452]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1225_c7_e452]
signal result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1225_c7_e452]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1226_c3_ca3d]
signal BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1227_c11_5aef]
signal BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1229_c32_13a7]
signal BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1229_c32_38db]
signal BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1229_c32_1773]
signal MUX_uxn_opcodes_h_l1229_c32_1773_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1229_c32_1773_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1229_c32_1773_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1229_c32_1773_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1231_c11_54de]
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1231_c7_b007]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1231_c7_b007]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1231_c7_b007]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1231_c7_b007]
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1231_c7_b007]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1237_c11_55f3]
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1237_c7_095b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1237_c7_095b]
signal result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1237_c7_095b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1237_c7_095b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1239_c34_df85]
signal CONST_SR_8_uxn_opcodes_h_l1239_c34_df85_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1239_c34_df85_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_c761]
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_8fd9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_8fd9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0
BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_left,
BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_right,
BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d
tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond,
tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output);

-- t16_MUX_uxn_opcodes_h_l1194_c2_f48d
t16_MUX_uxn_opcodes_h_l1194_c2_f48d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond,
t16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue,
t16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse,
t16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output);

-- n16_MUX_uxn_opcodes_h_l1194_c2_f48d
n16_MUX_uxn_opcodes_h_l1194_c2_f48d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond,
n16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue,
n16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse,
n16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d
result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output);

-- printf_uxn_opcodes_h_l1195_c3_ae90_uxn_opcodes_h_l1195_c3_ae90
printf_uxn_opcodes_h_l1195_c3_ae90_uxn_opcodes_h_l1195_c3_ae90 : entity work.printf_uxn_opcodes_h_l1195_c3_ae90_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1195_c3_ae90_uxn_opcodes_h_l1195_c3_ae90_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560
BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_left,
BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_right,
BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1199_c7_7759
tmp16_MUX_uxn_opcodes_h_l1199_c7_7759 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_cond,
tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue,
tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse,
tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output);

-- t16_MUX_uxn_opcodes_h_l1199_c7_7759
t16_MUX_uxn_opcodes_h_l1199_c7_7759 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1199_c7_7759_cond,
t16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue,
t16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse,
t16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output);

-- n16_MUX_uxn_opcodes_h_l1199_c7_7759
n16_MUX_uxn_opcodes_h_l1199_c7_7759 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1199_c7_7759_cond,
n16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue,
n16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse,
n16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759
result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759
result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759
result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759
result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_cond,
result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759
result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_left,
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_right,
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2
tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond,
tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output);

-- t16_MUX_uxn_opcodes_h_l1202_c7_fbb2
t16_MUX_uxn_opcodes_h_l1202_c7_fbb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond,
t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue,
t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse,
t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output);

-- n16_MUX_uxn_opcodes_h_l1202_c7_fbb2
n16_MUX_uxn_opcodes_h_l1202_c7_fbb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond,
n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue,
n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse,
n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9
BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_left,
BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_right,
BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0
tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond,
tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output);

-- t16_MUX_uxn_opcodes_h_l1207_c7_13f0
t16_MUX_uxn_opcodes_h_l1207_c7_13f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond,
t16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue,
t16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse,
t16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output);

-- n16_MUX_uxn_opcodes_h_l1207_c7_13f0
n16_MUX_uxn_opcodes_h_l1207_c7_13f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond,
n16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue,
n16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse,
n16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0
result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0
result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0
result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0
result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_left,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_right,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc
tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond,
tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output);

-- t16_MUX_uxn_opcodes_h_l1210_c7_e1fc
t16_MUX_uxn_opcodes_h_l1210_c7_e1fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond,
t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue,
t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse,
t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output);

-- n16_MUX_uxn_opcodes_h_l1210_c7_e1fc
n16_MUX_uxn_opcodes_h_l1210_c7_e1fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond,
n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue,
n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse,
n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07
BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_left,
BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_right,
BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_left,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_right,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59
tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_cond,
tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue,
tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse,
tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output);

-- n16_MUX_uxn_opcodes_h_l1214_c7_3f59
n16_MUX_uxn_opcodes_h_l1214_c7_3f59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1214_c7_3f59_cond,
n16_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue,
n16_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse,
n16_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59
result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_cond,
result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_left,
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_right,
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc
tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_cond,
tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output);

-- n16_MUX_uxn_opcodes_h_l1217_c7_38cc
n16_MUX_uxn_opcodes_h_l1217_c7_38cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1217_c7_38cc_cond,
n16_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue,
n16_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse,
n16_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc
result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_left,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_right,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c
tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_cond,
tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output);

-- n16_MUX_uxn_opcodes_h_l1222_c7_d77c
n16_MUX_uxn_opcodes_h_l1222_c7_d77c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1222_c7_d77c_cond,
n16_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue,
n16_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse,
n16_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_left,
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_right,
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1225_c7_e452
tmp16_MUX_uxn_opcodes_h_l1225_c7_e452 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_cond,
tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue,
tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse,
tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_return_output);

-- n16_MUX_uxn_opcodes_h_l1225_c7_e452
n16_MUX_uxn_opcodes_h_l1225_c7_e452 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1225_c7_e452_cond,
n16_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue,
n16_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse,
n16_MUX_uxn_opcodes_h_l1225_c7_e452_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452
result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_cond,
result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d
BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_left,
BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_right,
BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef
BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_left,
BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_right,
BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7
BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_left,
BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_right,
BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db
BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_left,
BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_right,
BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_return_output);

-- MUX_uxn_opcodes_h_l1229_c32_1773
MUX_uxn_opcodes_h_l1229_c32_1773 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1229_c32_1773_cond,
MUX_uxn_opcodes_h_l1229_c32_1773_iftrue,
MUX_uxn_opcodes_h_l1229_c32_1773_iffalse,
MUX_uxn_opcodes_h_l1229_c32_1773_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_left,
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_right,
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_cond,
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_left,
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_right,
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b
result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1239_c34_df85
CONST_SR_8_uxn_opcodes_h_l1239_c34_df85 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1239_c34_df85_x,
CONST_SR_8_uxn_opcodes_h_l1239_c34_df85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_left,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_right,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371
CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output,
 t16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output,
 n16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_return_output,
 tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output,
 t16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output,
 n16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output,
 t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output,
 n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output,
 t16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output,
 n16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output,
 t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output,
 n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_return_output,
 tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output,
 n16_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output,
 n16_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output,
 n16_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_return_output,
 tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_return_output,
 n16_MUX_uxn_opcodes_h_l1225_c7_e452_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_return_output,
 MUX_uxn_opcodes_h_l1229_c32_1773_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_return_output,
 CONST_SR_8_uxn_opcodes_h_l1239_c34_df85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1196_c3_f32b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1195_c3_ae90_uxn_opcodes_h_l1195_c3_ae90_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1200_c3_d5ab : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1205_c3_5815 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_38c1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_6f62 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_3f59_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1215_c3_3f24 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1217_c7_38cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_26a4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_e452_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_d77c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1223_c3_5f76 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_e452_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1229_c32_1773_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1229_c32_1773_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1229_c32_1773_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1229_c32_1773_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_3571 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1235_c24_69e7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1238_c3_c2c5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1239_c34_df85_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1239_c34_df85_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1239_c24_929f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_l1207_l1202_l1225_DUPLICATE_4f0d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1231_l1202_DUPLICATE_cc8f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1202_l1225_DUPLICATE_5c31_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1237_l1207_l1202_l1225_DUPLICATE_81b1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1199_l1222_l1217_l1214_l1241_l1210_l1237_l1207_l1231_l1202_l1225_DUPLICATE_8217_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1203_l1218_l1226_l1211_DUPLICATE_e59c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1237_l1225_DUPLICATE_0fe3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1190_l1246_DUPLICATE_c39c_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_6f62 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_6f62;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_right := to_unsigned(10, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_26a4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_26a4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1223_c3_5f76 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1223_c3_5f76;
     VAR_MUX_uxn_opcodes_h_l1229_c32_1773_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_right := to_unsigned(11, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1200_c3_d5ab := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1200_c3_d5ab;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1215_c3_3f24 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1215_c3_3f24;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1205_c3_5815 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1205_c3_5815;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_38c1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_38c1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1196_c3_f32b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1196_c3_f32b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_right := to_unsigned(8, 4);
     VAR_MUX_uxn_opcodes_h_l1229_c32_1773_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_3571 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_3571;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1238_c3_c2c5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1238_c3_c2c5;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1239_c34_df85_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_c761] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_left;
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_return_output := BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1225_c11_e409] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_left;
     BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_return_output := BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1217_c11_b7c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1194_c6_0aa0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1239_c34_df85] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1239_c34_df85_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1239_c34_df85_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1239_c34_df85_return_output := CONST_SR_8_uxn_opcodes_h_l1239_c34_df85_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1229_c32_13a7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_left;
     BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_return_output := BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_1143] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_left;
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_return_output := BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1237_l1207_l1202_l1225_DUPLICATE_81b1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1237_l1207_l1202_l1225_DUPLICATE_81b1_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1237_c11_55f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1235_c24_69e7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1235_c24_69e7_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_l1207_l1202_l1225_DUPLICATE_4f0d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_l1207_l1202_l1225_DUPLICATE_4f0d_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1203_l1218_l1226_l1211_DUPLICATE_e59c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1203_l1218_l1226_l1211_DUPLICATE_e59c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1237_l1225_DUPLICATE_0fe3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1237_l1225_DUPLICATE_0fe3_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_1a9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_7d0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1199_l1222_l1217_l1214_l1241_l1210_l1237_l1207_l1231_l1202_l1225_DUPLICATE_8217 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1199_l1222_l1217_l1214_l1241_l1210_l1237_l1207_l1231_l1202_l1225_DUPLICATE_8217_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1231_l1202_DUPLICATE_cc8f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1231_l1202_DUPLICATE_cc8f_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1202_l1225_DUPLICATE_5c31 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1202_l1225_DUPLICATE_5c31_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1231_c11_54de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_left;
     BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_return_output := BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1202_c11_698f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1199_c11_3560] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_left;
     BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_return_output := BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1207_c11_a0a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1229_c32_13a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c6_0aa0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1199_c7_7759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1199_c7_7759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1199_c11_3560_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_698f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1207_c11_a0a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7d0a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_3f59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_1143_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1217_c7_38cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_b7c0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_d77c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_1a9b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_e452_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e409_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_54de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_55f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c761_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1203_l1218_l1226_l1211_DUPLICATE_e59c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1203_l1218_l1226_l1211_DUPLICATE_e59c_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1203_l1218_l1226_l1211_DUPLICATE_e59c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1235_c24_69e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1202_l1225_DUPLICATE_5c31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1202_l1225_DUPLICATE_5c31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1202_l1225_DUPLICATE_5c31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1202_l1225_DUPLICATE_5c31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1202_l1225_DUPLICATE_5c31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1202_l1225_DUPLICATE_5c31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1202_l1225_DUPLICATE_5c31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1202_l1225_DUPLICATE_5c31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1202_l1225_DUPLICATE_5c31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1199_l1222_l1217_l1214_l1241_l1210_l1237_l1207_l1231_l1202_l1225_DUPLICATE_8217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1199_l1222_l1217_l1214_l1241_l1210_l1237_l1207_l1231_l1202_l1225_DUPLICATE_8217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1199_l1222_l1217_l1214_l1241_l1210_l1237_l1207_l1231_l1202_l1225_DUPLICATE_8217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1199_l1222_l1217_l1214_l1241_l1210_l1237_l1207_l1231_l1202_l1225_DUPLICATE_8217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1199_l1222_l1217_l1214_l1241_l1210_l1237_l1207_l1231_l1202_l1225_DUPLICATE_8217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1199_l1222_l1217_l1214_l1241_l1210_l1237_l1207_l1231_l1202_l1225_DUPLICATE_8217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1199_l1222_l1217_l1214_l1241_l1210_l1237_l1207_l1231_l1202_l1225_DUPLICATE_8217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1199_l1222_l1217_l1214_l1241_l1210_l1237_l1207_l1231_l1202_l1225_DUPLICATE_8217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1199_l1222_l1217_l1214_l1241_l1210_l1237_l1207_l1231_l1202_l1225_DUPLICATE_8217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1199_l1222_l1217_l1214_l1241_l1210_l1237_l1207_l1231_l1202_l1225_DUPLICATE_8217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1199_l1222_l1217_l1214_l1241_l1210_l1237_l1207_l1231_l1202_l1225_DUPLICATE_8217_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1231_l1202_DUPLICATE_cc8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1231_l1202_DUPLICATE_cc8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1231_l1202_DUPLICATE_cc8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1231_l1202_DUPLICATE_cc8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1231_l1202_DUPLICATE_cc8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1231_l1202_DUPLICATE_cc8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1231_l1202_DUPLICATE_cc8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1231_l1202_DUPLICATE_cc8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1207_l1231_l1202_DUPLICATE_cc8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_l1207_l1202_l1225_DUPLICATE_4f0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_l1207_l1202_l1225_DUPLICATE_4f0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_l1207_l1202_l1225_DUPLICATE_4f0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_l1207_l1202_l1225_DUPLICATE_4f0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_l1207_l1202_l1225_DUPLICATE_4f0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_l1207_l1202_l1225_DUPLICATE_4f0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_l1207_l1202_l1225_DUPLICATE_4f0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_l1207_l1202_l1225_DUPLICATE_4f0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_l1207_l1202_l1225_DUPLICATE_4f0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_l1207_l1202_l1225_DUPLICATE_4f0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1241_l1210_l1237_l1207_l1202_l1225_DUPLICATE_4f0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1237_l1225_DUPLICATE_0fe3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1237_l1225_DUPLICATE_0fe3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1237_l1207_l1202_l1225_DUPLICATE_81b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1237_l1207_l1202_l1225_DUPLICATE_81b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1237_l1207_l1202_l1225_DUPLICATE_81b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1237_l1207_l1202_l1225_DUPLICATE_81b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1237_l1207_l1202_l1225_DUPLICATE_81b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1237_l1207_l1202_l1225_DUPLICATE_81b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1237_l1207_l1202_l1225_DUPLICATE_81b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1237_l1207_l1202_l1225_DUPLICATE_81b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1237_l1207_l1202_l1225_DUPLICATE_81b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1199_l1222_l1194_l1217_l1214_l1210_l1237_l1207_l1202_l1225_DUPLICATE_81b1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1231_c7_b007] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_8fd9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1194_c1_627e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1237_c7_095b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1226_c3_ca3d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_left;
     BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_return_output := BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1239_c24_929f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1239_c24_929f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1239_c34_df85_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1229_c32_38db] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_left;
     BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_return_output := BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_8fd9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1211_c3_af07] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_left;
     BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_return_output := BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1229_c32_1773_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1229_c32_38db_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1211_c3_af07_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1226_c3_ca3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1239_c24_929f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1219_l1204_DUPLICATE_5371_return_output;
     VAR_printf_uxn_opcodes_h_l1195_c3_ae90_uxn_opcodes_h_l1195_c3_ae90_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1194_c1_627e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_8fd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_b007_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_8fd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_095b_return_output;
     -- n16_MUX[uxn_opcodes_h_l1225_c7_e452] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1225_c7_e452_cond <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_e452_cond;
     n16_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue;
     n16_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_e452_return_output := n16_MUX_uxn_opcodes_h_l1225_c7_e452_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1237_c7_095b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1231_c7_b007] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_return_output;

     -- printf_uxn_opcodes_h_l1195_c3_ae90[uxn_opcodes_h_l1195_c3_ae90] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1195_c3_ae90_uxn_opcodes_h_l1195_c3_ae90_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1195_c3_ae90_uxn_opcodes_h_l1195_c3_ae90_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1225_c7_e452] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_return_output;

     -- MUX[uxn_opcodes_h_l1229_c32_1773] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1229_c32_1773_cond <= VAR_MUX_uxn_opcodes_h_l1229_c32_1773_cond;
     MUX_uxn_opcodes_h_l1229_c32_1773_iftrue <= VAR_MUX_uxn_opcodes_h_l1229_c32_1773_iftrue;
     MUX_uxn_opcodes_h_l1229_c32_1773_iffalse <= VAR_MUX_uxn_opcodes_h_l1229_c32_1773_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1229_c32_1773_return_output := MUX_uxn_opcodes_h_l1229_c32_1773_return_output;

     -- t16_MUX[uxn_opcodes_h_l1210_c7_e1fc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond;
     t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue;
     t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output := t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1227_c11_5aef] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_left;
     BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_return_output := BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1237_c7_095b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1237_c7_095b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1227_c11_5aef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue := VAR_MUX_uxn_opcodes_h_l1229_c32_1773_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1225_c7_e452_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_095b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_e452_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_095b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_b007_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_095b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1222_c7_d77c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1207_c7_13f0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond;
     t16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue;
     t16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output := t16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1225_c7_e452] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1225_c7_e452] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_cond;
     tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_return_output := tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1231_c7_b007] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1231_c7_b007] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1225_c7_e452] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1231_c7_b007] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_return_output := result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_return_output;

     -- n16_MUX[uxn_opcodes_h_l1222_c7_d77c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1222_c7_d77c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_d77c_cond;
     n16_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue;
     n16_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output := n16_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_b007_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_b007_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_e452_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_e452_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_b007_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1225_c7_e452_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1225_c7_e452] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_return_output := result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1225_c7_e452] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1222_c7_d77c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_cond;
     tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output := tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1202_c7_fbb2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond;
     t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue;
     t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output := t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1217_c7_38cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_d77c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1217_c7_38cc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1217_c7_38cc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1217_c7_38cc_cond;
     n16_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue;
     n16_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output := n16_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_d77c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1225_c7_e452] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_e452_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_e452_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1225_c7_e452_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1217_c7_38cc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_cond;
     tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output := tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1214_c7_3f59] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1214_c7_3f59_cond <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_3f59_cond;
     n16_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue;
     n16_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output := n16_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1222_c7_d77c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1199_c7_7759] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1199_c7_7759_cond <= VAR_t16_MUX_uxn_opcodes_h_l1199_c7_7759_cond;
     t16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue;
     t16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output := t16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1214_c7_3f59] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1217_c7_38cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_d77c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1217_c7_38cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_d77c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_d77c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output;
     -- t16_MUX[uxn_opcodes_h_l1194_c2_f48d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond;
     t16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue;
     t16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output := t16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1217_c7_38cc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1217_c7_38cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1214_c7_3f59] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_cond;
     tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output := tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c7_3f59] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1217_c7_38cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1210_c7_e1fc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1210_c7_e1fc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond;
     n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue;
     n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output := n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c7_3f59] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1217_c7_38cc_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1210_c7_e1fc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond;
     tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output := tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1207_c7_13f0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond;
     n16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue;
     n16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output := n16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_3f59] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1214_c7_3f59] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output := result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_e1fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_3f59] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1207_c7_13f0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_e1fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1214_c7_3f59_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_e1fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1210_c7_e1fc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1207_c7_13f0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_cond;
     tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output := tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1207_c7_13f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1207_c7_13f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1202_c7_fbb2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond;
     n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue;
     n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output := n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_e1fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1202_c7_fbb2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1210_c7_e1fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1207_c7_13f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1207_c7_13f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1202_c7_fbb2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1202_c7_fbb2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1207_c7_13f0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1199_c7_7759] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1202_c7_fbb2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond;
     tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output := tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1199_c7_7759] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1199_c7_7759_cond <= VAR_n16_MUX_uxn_opcodes_h_l1199_c7_7759_cond;
     n16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue;
     n16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output := n16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1207_c7_13f0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1202_c7_fbb2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1199_c7_7759] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_cond;
     tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output := tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1199_c7_7759] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1202_c7_fbb2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1202_c7_fbb2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1194_c2_f48d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond;
     n16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue;
     n16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output := n16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1199_c7_7759] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1194_c2_f48d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_fbb2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1199_c7_7759] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1199_c7_7759] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1194_c2_f48d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1194_c2_f48d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1194_c2_f48d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_cond;
     tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output := tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1199_c7_7759] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_return_output := result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1199_c7_7759_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1194_c2_f48d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1194_c2_f48d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1194_c2_f48d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1190_l1246_DUPLICATE_c39c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1190_l1246_DUPLICATE_c39c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c2_f48d_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1190_l1246_DUPLICATE_c39c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1190_l1246_DUPLICATE_c39c_return_output;
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
