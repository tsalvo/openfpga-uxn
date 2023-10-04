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
entity and2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_201aeef3;
architecture arch of and2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l829_c6_4683]
signal BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l829_c1_0211]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l829_c2_2d2e]
signal tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l829_c2_2d2e]
signal t16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l829_c2_2d2e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l829_c2_2d2e]
signal result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l829_c2_2d2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l829_c2_2d2e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l829_c2_2d2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l829_c2_2d2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l829_c2_2d2e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l829_c2_2d2e]
signal n16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l830_c3_c702[uxn_opcodes_h_l830_c3_c702]
signal printf_uxn_opcodes_h_l830_c3_c702_uxn_opcodes_h_l830_c3_c702_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l835_c11_dd6d]
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l835_c7_6b30]
signal tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l835_c7_6b30]
signal t16_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_6b30]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l835_c7_6b30]
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_6b30]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_6b30]
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_6b30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_6b30]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l835_c7_6b30]
signal result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l835_c7_6b30]
signal n16_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l838_c11_403b]
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l838_c7_d692]
signal tmp16_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l838_c7_d692]
signal t16_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l838_c7_d692]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l838_c7_d692]
signal result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_d692]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_d692]
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_d692]
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_d692]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l838_c7_d692]
signal result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l838_c7_d692]
signal n16_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l843_c11_9d34]
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l843_c7_3f57]
signal tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l843_c7_3f57]
signal t16_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l843_c7_3f57]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l843_c7_3f57]
signal result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l843_c7_3f57]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l843_c7_3f57]
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l843_c7_3f57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l843_c7_3f57]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l843_c7_3f57]
signal result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l843_c7_3f57]
signal n16_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l846_c11_5c59]
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l846_c7_4890]
signal tmp16_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l846_c7_4890]
signal t16_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l846_c7_4890]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l846_c7_4890]
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l846_c7_4890]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l846_c7_4890]
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l846_c7_4890]
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l846_c7_4890]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l846_c7_4890]
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l846_c7_4890]
signal n16_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l847_c3_1206]
signal BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l850_c11_3a3c]
signal BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l850_c7_f603]
signal tmp16_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l850_c7_f603_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l850_c7_f603]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l850_c7_f603]
signal result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l850_c7_f603]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l850_c7_f603]
signal result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l850_c7_f603]
signal result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l850_c7_f603]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l850_c7_f603]
signal result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l850_c7_f603]
signal n16_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l850_c7_f603_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l853_c11_c8e7]
signal BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l853_c7_82a1]
signal tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l853_c7_82a1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l853_c7_82a1]
signal result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c7_82a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l853_c7_82a1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l853_c7_82a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c7_82a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l853_c7_82a1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l853_c7_82a1]
signal n16_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l858_c11_ba23]
signal BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l858_c7_1307]
signal tmp16_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l858_c7_1307_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l858_c7_1307]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l858_c7_1307]
signal result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l858_c7_1307]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l858_c7_1307]
signal result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l858_c7_1307]
signal result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l858_c7_1307]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l858_c7_1307]
signal result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l858_c7_1307]
signal n16_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l858_c7_1307_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l861_c11_a057]
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l861_c7_8ae6]
signal tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l861_c7_8ae6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l861_c7_8ae6]
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l861_c7_8ae6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l861_c7_8ae6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l861_c7_8ae6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l861_c7_8ae6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l861_c7_8ae6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l861_c7_8ae6]
signal n16_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l862_c3_e993]
signal BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l863_c11_9a04]
signal BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l866_c32_267d]
signal BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l866_c32_54c6]
signal BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l866_c32_e764]
signal MUX_uxn_opcodes_h_l866_c32_e764_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l866_c32_e764_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l866_c32_e764_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l866_c32_e764_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l868_c11_b12c]
signal BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l868_c7_b7d2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l868_c7_b7d2]
signal result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l868_c7_b7d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l868_c7_b7d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l868_c7_b7d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l874_c11_b9e6]
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_6456]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l874_c7_6456]
signal result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_6456]
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_6456]
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l876_c34_2ce7]
signal CONST_SR_8_uxn_opcodes_h_l876_c34_2ce7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l876_c34_2ce7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l878_c11_4804]
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l878_c7_63f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l878_c7_63f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683
BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_left,
BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_right,
BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_return_output);

-- tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e
tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond,
tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue,
tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse,
tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output);

-- t16_MUX_uxn_opcodes_h_l829_c2_2d2e
t16_MUX_uxn_opcodes_h_l829_c2_2d2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond,
t16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue,
t16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse,
t16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e
result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e
result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_cond,
result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e
result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e
result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e
result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output);

-- n16_MUX_uxn_opcodes_h_l829_c2_2d2e
n16_MUX_uxn_opcodes_h_l829_c2_2d2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond,
n16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue,
n16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse,
n16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output);

-- printf_uxn_opcodes_h_l830_c3_c702_uxn_opcodes_h_l830_c3_c702
printf_uxn_opcodes_h_l830_c3_c702_uxn_opcodes_h_l830_c3_c702 : entity work.printf_uxn_opcodes_h_l830_c3_c702_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l830_c3_c702_uxn_opcodes_h_l830_c3_c702_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d
BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_left,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_right,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l835_c7_6b30
tmp16_MUX_uxn_opcodes_h_l835_c7_6b30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_cond,
tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue,
tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse,
tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output);

-- t16_MUX_uxn_opcodes_h_l835_c7_6b30
t16_MUX_uxn_opcodes_h_l835_c7_6b30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l835_c7_6b30_cond,
t16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue,
t16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse,
t16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30
result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_cond,
result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30
result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_return_output);

-- n16_MUX_uxn_opcodes_h_l835_c7_6b30
n16_MUX_uxn_opcodes_h_l835_c7_6b30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l835_c7_6b30_cond,
n16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue,
n16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse,
n16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b
BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_left,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_right,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l838_c7_d692
tmp16_MUX_uxn_opcodes_h_l838_c7_d692 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l838_c7_d692_cond,
tmp16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue,
tmp16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse,
tmp16_MUX_uxn_opcodes_h_l838_c7_d692_return_output);

-- t16_MUX_uxn_opcodes_h_l838_c7_d692
t16_MUX_uxn_opcodes_h_l838_c7_d692 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l838_c7_d692_cond,
t16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue,
t16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse,
t16_MUX_uxn_opcodes_h_l838_c7_d692_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692
result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_cond,
result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692
result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_return_output);

-- n16_MUX_uxn_opcodes_h_l838_c7_d692
n16_MUX_uxn_opcodes_h_l838_c7_d692 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l838_c7_d692_cond,
n16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue,
n16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse,
n16_MUX_uxn_opcodes_h_l838_c7_d692_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34
BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_left,
BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_right,
BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_return_output);

-- tmp16_MUX_uxn_opcodes_h_l843_c7_3f57
tmp16_MUX_uxn_opcodes_h_l843_c7_3f57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_cond,
tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue,
tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse,
tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output);

-- t16_MUX_uxn_opcodes_h_l843_c7_3f57
t16_MUX_uxn_opcodes_h_l843_c7_3f57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l843_c7_3f57_cond,
t16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue,
t16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse,
t16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57
result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_cond,
result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57
result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_return_output);

-- n16_MUX_uxn_opcodes_h_l843_c7_3f57
n16_MUX_uxn_opcodes_h_l843_c7_3f57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l843_c7_3f57_cond,
n16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue,
n16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse,
n16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59
BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_left,
BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_right,
BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_return_output);

-- tmp16_MUX_uxn_opcodes_h_l846_c7_4890
tmp16_MUX_uxn_opcodes_h_l846_c7_4890 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l846_c7_4890_cond,
tmp16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue,
tmp16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse,
tmp16_MUX_uxn_opcodes_h_l846_c7_4890_return_output);

-- t16_MUX_uxn_opcodes_h_l846_c7_4890
t16_MUX_uxn_opcodes_h_l846_c7_4890 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l846_c7_4890_cond,
t16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue,
t16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse,
t16_MUX_uxn_opcodes_h_l846_c7_4890_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890
result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_cond,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_return_output);

-- n16_MUX_uxn_opcodes_h_l846_c7_4890
n16_MUX_uxn_opcodes_h_l846_c7_4890 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l846_c7_4890_cond,
n16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue,
n16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse,
n16_MUX_uxn_opcodes_h_l846_c7_4890_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l847_c3_1206
BIN_OP_OR_uxn_opcodes_h_l847_c3_1206 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_left,
BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_right,
BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c
BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_left,
BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_right,
BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l850_c7_f603
tmp16_MUX_uxn_opcodes_h_l850_c7_f603 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l850_c7_f603_cond,
tmp16_MUX_uxn_opcodes_h_l850_c7_f603_iftrue,
tmp16_MUX_uxn_opcodes_h_l850_c7_f603_iffalse,
tmp16_MUX_uxn_opcodes_h_l850_c7_f603_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603
result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603
result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_cond,
result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603
result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603
result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603
result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603
result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_return_output);

-- n16_MUX_uxn_opcodes_h_l850_c7_f603
n16_MUX_uxn_opcodes_h_l850_c7_f603 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l850_c7_f603_cond,
n16_MUX_uxn_opcodes_h_l850_c7_f603_iftrue,
n16_MUX_uxn_opcodes_h_l850_c7_f603_iffalse,
n16_MUX_uxn_opcodes_h_l850_c7_f603_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7
BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_left,
BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_right,
BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l853_c7_82a1
tmp16_MUX_uxn_opcodes_h_l853_c7_82a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_cond,
tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue,
tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse,
tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1
result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1
result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_cond,
result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1
result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1
result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1
result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_return_output);

-- n16_MUX_uxn_opcodes_h_l853_c7_82a1
n16_MUX_uxn_opcodes_h_l853_c7_82a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l853_c7_82a1_cond,
n16_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue,
n16_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse,
n16_MUX_uxn_opcodes_h_l853_c7_82a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23
BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_left,
BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_right,
BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_return_output);

-- tmp16_MUX_uxn_opcodes_h_l858_c7_1307
tmp16_MUX_uxn_opcodes_h_l858_c7_1307 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l858_c7_1307_cond,
tmp16_MUX_uxn_opcodes_h_l858_c7_1307_iftrue,
tmp16_MUX_uxn_opcodes_h_l858_c7_1307_iffalse,
tmp16_MUX_uxn_opcodes_h_l858_c7_1307_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307
result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307
result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_cond,
result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307
result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307
result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307
result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307
result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_return_output);

-- n16_MUX_uxn_opcodes_h_l858_c7_1307
n16_MUX_uxn_opcodes_h_l858_c7_1307 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l858_c7_1307_cond,
n16_MUX_uxn_opcodes_h_l858_c7_1307_iftrue,
n16_MUX_uxn_opcodes_h_l858_c7_1307_iffalse,
n16_MUX_uxn_opcodes_h_l858_c7_1307_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057
BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_left,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_right,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_return_output);

-- tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6
tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_cond,
tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue,
tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse,
tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6
result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_cond,
result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output);

-- n16_MUX_uxn_opcodes_h_l861_c7_8ae6
n16_MUX_uxn_opcodes_h_l861_c7_8ae6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l861_c7_8ae6_cond,
n16_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue,
n16_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse,
n16_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l862_c3_e993
BIN_OP_OR_uxn_opcodes_h_l862_c3_e993 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_left,
BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_right,
BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04
BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_left,
BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_right,
BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l866_c32_267d
BIN_OP_AND_uxn_opcodes_h_l866_c32_267d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_left,
BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_right,
BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6
BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_left,
BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_right,
BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_return_output);

-- MUX_uxn_opcodes_h_l866_c32_e764
MUX_uxn_opcodes_h_l866_c32_e764 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l866_c32_e764_cond,
MUX_uxn_opcodes_h_l866_c32_e764_iftrue,
MUX_uxn_opcodes_h_l866_c32_e764_iffalse,
MUX_uxn_opcodes_h_l866_c32_e764_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c
BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_left,
BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_right,
BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2
result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2
result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_cond,
result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2
result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2
result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6
BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_left,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_right,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456
result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_cond,
result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_return_output);

-- CONST_SR_8_uxn_opcodes_h_l876_c34_2ce7
CONST_SR_8_uxn_opcodes_h_l876_c34_2ce7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l876_c34_2ce7_x,
CONST_SR_8_uxn_opcodes_h_l876_c34_2ce7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804
BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_left,
BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_right,
BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a
CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_return_output,
 tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output,
 t16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output,
 n16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_return_output,
 tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output,
 t16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_return_output,
 n16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_return_output,
 tmp16_MUX_uxn_opcodes_h_l838_c7_d692_return_output,
 t16_MUX_uxn_opcodes_h_l838_c7_d692_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_return_output,
 n16_MUX_uxn_opcodes_h_l838_c7_d692_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_return_output,
 tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output,
 t16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_return_output,
 n16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_return_output,
 tmp16_MUX_uxn_opcodes_h_l846_c7_4890_return_output,
 t16_MUX_uxn_opcodes_h_l846_c7_4890_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_return_output,
 n16_MUX_uxn_opcodes_h_l846_c7_4890_return_output,
 BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_return_output,
 tmp16_MUX_uxn_opcodes_h_l850_c7_f603_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_return_output,
 n16_MUX_uxn_opcodes_h_l850_c7_f603_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_return_output,
 tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_return_output,
 n16_MUX_uxn_opcodes_h_l853_c7_82a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_return_output,
 tmp16_MUX_uxn_opcodes_h_l858_c7_1307_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_return_output,
 n16_MUX_uxn_opcodes_h_l858_c7_1307_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_return_output,
 tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output,
 n16_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_return_output,
 BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_return_output,
 BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_return_output,
 MUX_uxn_opcodes_h_l866_c32_e764_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_return_output,
 CONST_SR_8_uxn_opcodes_h_l876_c34_2ce7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_8094 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l830_c3_c702_uxn_opcodes_h_l830_c3_c702_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_2644 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_d692_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l835_c7_6b30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_b083 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l838_c7_d692_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l844_c3_17b2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l846_c7_4890_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l843_c7_3f57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l850_c7_f603_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l848_c3_a0ae : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l850_c7_f603_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l846_c7_4890_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l851_c3_a5df : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l850_c7_f603_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l850_c7_f603_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c7_82a1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l850_c7_f603_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l858_c7_1307_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l856_c3_d65d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l858_c7_1307_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c7_82a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_5f97 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l858_c7_1307_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l858_c7_1307_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l858_c7_1307_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_8ae6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l866_c32_e764_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l866_c32_e764_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l866_c32_e764_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l866_c32_e764_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l871_c3_ba0d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l872_c24_6985_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l875_c3_9d03 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l876_c34_2ce7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l876_c34_2ce7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l876_c24_56a5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l853_l868_l858_l838_l829_DUPLICATE_d677_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_DUPLICATE_dd69_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_l829_DUPLICATE_7869_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_l878_DUPLICATE_69a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l868_l858_l838_l878_DUPLICATE_3b00_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_DUPLICATE_0eb3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l847_l839_l854_l862_DUPLICATE_3c3d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l861_l874_DUPLICATE_23a8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l883_l825_DUPLICATE_31b5_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_b083 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_b083;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_2644 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l836_c3_2644;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l856_c3_d65d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l856_c3_d65d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l844_c3_17b2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l844_c3_17b2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l866_c32_e764_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_right := to_unsigned(11, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l848_c3_a0ae := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l848_c3_a0ae;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_5f97 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_5f97;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l871_c3_ba0d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l871_c3_ba0d;
     VAR_BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l875_c3_9d03 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l875_c3_9d03;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l851_c3_a5df := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l851_c3_a5df;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l866_c32_e764_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_8094 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_8094;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l850_c7_f603_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l858_c7_1307_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l876_c34_2ce7_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l850_c7_f603_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l858_c7_1307_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse := tmp16;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_l829_DUPLICATE_7869 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_l829_DUPLICATE_7869_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l868_l858_l838_l878_DUPLICATE_3b00 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l868_l858_l838_l878_DUPLICATE_3b00_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_DUPLICATE_0eb3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_DUPLICATE_0eb3_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l861_c11_a057] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_left;
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_return_output := BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l846_c11_5c59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_left;
     BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_return_output := BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l853_c11_c8e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_DUPLICATE_dd69 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_DUPLICATE_dd69_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l843_c11_9d34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_left;
     BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_return_output := BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l850_c11_3a3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l868_c11_b12c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_left;
     BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_return_output := BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l878_c11_4804] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_left;
     BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_return_output := BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l847_l839_l854_l862_DUPLICATE_3c3d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l847_l839_l854_l862_DUPLICATE_3c3d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_AND[uxn_opcodes_h_l866_c32_267d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_left;
     BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_return_output := BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l858_c11_ba23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_left;
     BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_return_output := BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l829_c6_4683] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_left;
     BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_return_output := BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l838_c11_403b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_left;
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_return_output := BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l872_c24_6985] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l872_c24_6985_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l861_l874_DUPLICATE_23a8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l861_l874_DUPLICATE_23a8_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l853_l868_l858_l838_l829_DUPLICATE_d677 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l853_l868_l858_l838_l829_DUPLICATE_d677_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_l878_DUPLICATE_69a5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_l878_DUPLICATE_69a5_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l876_c34_2ce7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l876_c34_2ce7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l876_c34_2ce7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l876_c34_2ce7_return_output := CONST_SR_8_uxn_opcodes_h_l876_c34_2ce7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l835_c11_dd6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l874_c11_b9e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_left := VAR_BIN_OP_AND_uxn_opcodes_h_l866_c32_267d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c6_4683_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_6b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_6b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd6d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_d692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_d692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_403b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_3f57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_3f57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_9d34_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l846_c7_4890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_4890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_4890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_5c59_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l850_c7_f603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l850_c7_f603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_3a3c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l853_c7_82a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l858_c7_1307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l858_c7_1307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_ba23_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_8ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_a057_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l868_c11_b12c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_b9e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_4804_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l847_l839_l854_l862_DUPLICATE_3c3d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l847_l839_l854_l862_DUPLICATE_3c3d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l847_l839_l854_l862_DUPLICATE_3c3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l872_c24_6985_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_l829_DUPLICATE_7869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_l829_DUPLICATE_7869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_l829_DUPLICATE_7869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_l829_DUPLICATE_7869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_l829_DUPLICATE_7869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_l829_DUPLICATE_7869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_l829_DUPLICATE_7869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_l829_DUPLICATE_7869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_l829_DUPLICATE_7869_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l868_l858_l838_l878_DUPLICATE_3b00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l868_l858_l838_l878_DUPLICATE_3b00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l868_l858_l838_l878_DUPLICATE_3b00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l868_l858_l838_l878_DUPLICATE_3b00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l868_l858_l838_l878_DUPLICATE_3b00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l868_l858_l838_l878_DUPLICATE_3b00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l868_l858_l838_l878_DUPLICATE_3b00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l868_l858_l838_l878_DUPLICATE_3b00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l868_l858_l838_l878_DUPLICATE_3b00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l868_l858_l838_l878_DUPLICATE_3b00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l868_l858_l838_l878_DUPLICATE_3b00_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l853_l868_l858_l838_l829_DUPLICATE_d677_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l853_l868_l858_l838_l829_DUPLICATE_d677_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l853_l868_l858_l838_l829_DUPLICATE_d677_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l853_l868_l858_l838_l829_DUPLICATE_d677_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l853_l868_l858_l838_l829_DUPLICATE_d677_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l853_l868_l858_l838_l829_DUPLICATE_d677_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l853_l868_l858_l838_l829_DUPLICATE_d677_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l853_l868_l858_l838_l829_DUPLICATE_d677_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l843_l835_l846_l850_l853_l868_l858_l838_l829_DUPLICATE_d677_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_DUPLICATE_0eb3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_DUPLICATE_0eb3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_DUPLICATE_0eb3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_DUPLICATE_0eb3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_DUPLICATE_0eb3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_DUPLICATE_0eb3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_DUPLICATE_0eb3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l835_l846_l850_l861_l853_l858_l838_DUPLICATE_0eb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_l878_DUPLICATE_69a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_l878_DUPLICATE_69a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_l878_DUPLICATE_69a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_l878_DUPLICATE_69a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_l878_DUPLICATE_69a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_l878_DUPLICATE_69a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_l878_DUPLICATE_69a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_l878_DUPLICATE_69a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_l878_DUPLICATE_69a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_l878_DUPLICATE_69a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_l878_DUPLICATE_69a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l861_l874_DUPLICATE_23a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l861_l874_DUPLICATE_23a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_DUPLICATE_dd69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_DUPLICATE_dd69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_DUPLICATE_dd69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_DUPLICATE_dd69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_DUPLICATE_dd69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_DUPLICATE_dd69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_DUPLICATE_dd69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_DUPLICATE_dd69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_DUPLICATE_dd69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l843_l835_l846_l850_l874_l861_l853_l858_l838_l829_DUPLICATE_dd69_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_6456] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l876_c24_56a5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l876_c24_56a5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l876_c34_2ce7_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l862_c3_e993] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_left;
     BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_return_output := BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l861_c7_8ae6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l866_c32_54c6] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_left;
     BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_return_output := BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l868_c7_b7d2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l878_c7_63f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l829_c1_0211] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l878_c7_63f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l847_c3_1206] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_left;
     BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_return_output := BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l866_c32_e764_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l866_c32_54c6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l847_c3_1206_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_right := VAR_BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l862_c3_e993_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l876_c24_56a5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l840_l855_DUPLICATE_e59a_return_output;
     VAR_printf_uxn_opcodes_h_l830_c3_c702_uxn_opcodes_h_l830_c3_c702_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l829_c1_0211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_63f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_63f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_6456_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l858_c7_1307] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_6456] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l874_c7_6456] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_cond;
     result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_return_output := result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l861_c7_8ae6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;

     -- printf_uxn_opcodes_h_l830_c3_c702[uxn_opcodes_h_l830_c3_c702] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l830_c3_c702_uxn_opcodes_h_l830_c3_c702_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l830_c3_c702_uxn_opcodes_h_l830_c3_c702_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l868_c7_b7d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output;

     -- MUX[uxn_opcodes_h_l866_c32_e764] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l866_c32_e764_cond <= VAR_MUX_uxn_opcodes_h_l866_c32_e764_cond;
     MUX_uxn_opcodes_h_l866_c32_e764_iftrue <= VAR_MUX_uxn_opcodes_h_l866_c32_e764_iftrue;
     MUX_uxn_opcodes_h_l866_c32_e764_iffalse <= VAR_MUX_uxn_opcodes_h_l866_c32_e764_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l866_c32_e764_return_output := MUX_uxn_opcodes_h_l866_c32_e764_return_output;

     -- t16_MUX[uxn_opcodes_h_l846_c7_4890] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l846_c7_4890_cond <= VAR_t16_MUX_uxn_opcodes_h_l846_c7_4890_cond;
     t16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue;
     t16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_4890_return_output := t16_MUX_uxn_opcodes_h_l846_c7_4890_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l863_c11_9a04] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_left;
     BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_return_output := BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_return_output;

     -- n16_MUX[uxn_opcodes_h_l861_c7_8ae6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l861_c7_8ae6_cond <= VAR_n16_MUX_uxn_opcodes_h_l861_c7_8ae6_cond;
     n16_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue;
     n16_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output := n16_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_6456] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l863_c11_9a04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue := VAR_MUX_uxn_opcodes_h_l866_c32_e764_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l858_c7_1307_iffalse := VAR_n16_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_6456_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_1307_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_6456_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l874_c7_6456_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse := VAR_t16_MUX_uxn_opcodes_h_l846_c7_4890_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l861_c7_8ae6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_cond;
     tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output := tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l861_c7_8ae6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l868_c7_b7d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output;

     -- n16_MUX[uxn_opcodes_h_l858_c7_1307] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l858_c7_1307_cond <= VAR_n16_MUX_uxn_opcodes_h_l858_c7_1307_cond;
     n16_MUX_uxn_opcodes_h_l858_c7_1307_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l858_c7_1307_iftrue;
     n16_MUX_uxn_opcodes_h_l858_c7_1307_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l858_c7_1307_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l858_c7_1307_return_output := n16_MUX_uxn_opcodes_h_l858_c7_1307_return_output;

     -- t16_MUX[uxn_opcodes_h_l843_c7_3f57] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l843_c7_3f57_cond <= VAR_t16_MUX_uxn_opcodes_h_l843_c7_3f57_cond;
     t16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue;
     t16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output := t16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l861_c7_8ae6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l868_c7_b7d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l853_c7_82a1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l868_c7_b7d2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output := result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l858_c7_1307] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l858_c7_1307_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_1307_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l868_c7_b7d2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse := VAR_t16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l858_c7_1307_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l858_c7_1307] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l858_c7_1307_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l858_c7_1307_cond;
     tmp16_MUX_uxn_opcodes_h_l858_c7_1307_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l858_c7_1307_iftrue;
     tmp16_MUX_uxn_opcodes_h_l858_c7_1307_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l858_c7_1307_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l858_c7_1307_return_output := tmp16_MUX_uxn_opcodes_h_l858_c7_1307_return_output;

     -- n16_MUX[uxn_opcodes_h_l853_c7_82a1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l853_c7_82a1_cond <= VAR_n16_MUX_uxn_opcodes_h_l853_c7_82a1_cond;
     n16_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue;
     n16_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l853_c7_82a1_return_output := n16_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l858_c7_1307] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l861_c7_8ae6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;

     -- t16_MUX[uxn_opcodes_h_l838_c7_d692] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l838_c7_d692_cond <= VAR_t16_MUX_uxn_opcodes_h_l838_c7_d692_cond;
     t16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue;
     t16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l838_c7_d692_return_output := t16_MUX_uxn_opcodes_h_l838_c7_d692_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l850_c7_f603] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l861_c7_8ae6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l861_c7_8ae6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output := result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l853_c7_82a1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l858_c7_1307] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l850_c7_f603_iffalse := VAR_n16_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_f603_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_1307_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_1307_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_8ae6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse := VAR_t16_MUX_uxn_opcodes_h_l838_c7_d692_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l858_c7_1307_return_output;
     -- t16_MUX[uxn_opcodes_h_l835_c7_6b30] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l835_c7_6b30_cond <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_6b30_cond;
     t16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue;
     t16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output := t16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l853_c7_82a1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_cond;
     tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_return_output := tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;

     -- n16_MUX[uxn_opcodes_h_l850_c7_f603] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l850_c7_f603_cond <= VAR_n16_MUX_uxn_opcodes_h_l850_c7_f603_cond;
     n16_MUX_uxn_opcodes_h_l850_c7_f603_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l850_c7_f603_iftrue;
     n16_MUX_uxn_opcodes_h_l850_c7_f603_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l850_c7_f603_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l850_c7_f603_return_output := n16_MUX_uxn_opcodes_h_l850_c7_f603_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l850_c7_f603] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l858_c7_1307] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c7_82a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l858_c7_1307] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c7_82a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l846_c7_4890] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l858_c7_1307] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_cond;
     result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_return_output := result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse := VAR_n16_MUX_uxn_opcodes_h_l850_c7_f603_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_1307_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_f603_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4890_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_1307_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_1307_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l850_c7_f603_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l846_c7_4890] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l853_c7_82a1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_return_output := result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l850_c7_f603] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l850_c7_f603_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l850_c7_f603_cond;
     tmp16_MUX_uxn_opcodes_h_l850_c7_f603_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l850_c7_f603_iftrue;
     tmp16_MUX_uxn_opcodes_h_l850_c7_f603_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l850_c7_f603_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l850_c7_f603_return_output := tmp16_MUX_uxn_opcodes_h_l850_c7_f603_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l843_c7_3f57] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;

     -- t16_MUX[uxn_opcodes_h_l829_c2_2d2e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond <= VAR_t16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond;
     t16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue;
     t16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output := t16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l853_c7_82a1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l853_c7_82a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l850_c7_f603] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_return_output;

     -- n16_MUX[uxn_opcodes_h_l846_c7_4890] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l846_c7_4890_cond <= VAR_n16_MUX_uxn_opcodes_h_l846_c7_4890_cond;
     n16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue;
     n16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l846_c7_4890_return_output := n16_MUX_uxn_opcodes_h_l846_c7_4890_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l850_c7_f603] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse := VAR_n16_MUX_uxn_opcodes_h_l846_c7_4890_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4890_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_f603_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_f603_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_82a1_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l850_c7_f603_return_output;
     -- n16_MUX[uxn_opcodes_h_l843_c7_3f57] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l843_c7_3f57_cond <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_3f57_cond;
     n16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue;
     n16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output := n16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l850_c7_f603] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l843_c7_3f57] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l850_c7_f603] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l838_c7_d692] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l846_c7_4890] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l846_c7_4890_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_4890_cond;
     tmp16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_4890_iftrue;
     tmp16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_4890_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_4890_return_output := tmp16_MUX_uxn_opcodes_h_l846_c7_4890_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l846_c7_4890] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l850_c7_f603] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_cond;
     result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_return_output := result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l846_c7_4890] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse := VAR_n16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_f603_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c7_d692_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_f603_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4890_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4890_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_f603_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_4890_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l843_c7_3f57] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l843_c7_3f57] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_cond;
     tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue;
     tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output := tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l846_c7_4890] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_cond;
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_return_output := result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l846_c7_4890] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l846_c7_4890] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l835_c7_6b30] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l843_c7_3f57] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;

     -- n16_MUX[uxn_opcodes_h_l838_c7_d692] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l838_c7_d692_cond <= VAR_n16_MUX_uxn_opcodes_h_l838_c7_d692_cond;
     n16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue;
     n16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l838_c7_d692_return_output := n16_MUX_uxn_opcodes_h_l838_c7_d692_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l838_c7_d692] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse := VAR_n16_MUX_uxn_opcodes_h_l838_c7_d692_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4890_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_d692_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4890_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4890_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_d692] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_6b30] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l838_c7_d692] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l838_c7_d692_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d692_cond;
     tmp16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d692_iftrue;
     tmp16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d692_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d692_return_output := tmp16_MUX_uxn_opcodes_h_l838_c7_d692_return_output;

     -- n16_MUX[uxn_opcodes_h_l835_c7_6b30] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l835_c7_6b30_cond <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_6b30_cond;
     n16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue;
     n16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output := n16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l843_c7_3f57] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_cond;
     result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_return_output := result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l843_c7_3f57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l829_c2_2d2e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_d692] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l843_c7_3f57] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_d692_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_d692_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_3f57_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l838_c7_d692_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l835_c7_6b30] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_cond;
     tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue;
     tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output := tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l829_c2_2d2e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output;

     -- n16_MUX[uxn_opcodes_h_l829_c2_2d2e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond <= VAR_n16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond;
     n16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue;
     n16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output := n16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_6b30] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_d692] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l838_c7_d692] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_cond;
     result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_return_output := result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_d692] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_6b30] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_d692_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_d692_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c7_d692_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_6b30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l829_c2_2d2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l829_c2_2d2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l829_c2_2d2e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_cond;
     tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output := tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_6b30] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l835_c7_6b30] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_cond;
     result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_return_output := result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_6b30_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l829_c2_2d2e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output := result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l829_c2_2d2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l829_c2_2d2e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l883_l825_DUPLICATE_31b5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l883_l825_DUPLICATE_31b5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l829_c2_2d2e_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l883_l825_DUPLICATE_31b5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l883_l825_DUPLICATE_31b5_return_output;
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
